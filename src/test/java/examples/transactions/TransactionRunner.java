package examples.transactions;

import com.intuit.karate.junit5.Karate;

class TransactionRunner {
    
    @Karate.Test
    Karate testTransactions() {
        return Karate.run("transaction").relativeTo(getClass());
    }

    @Karate.Test
    Karate testTransactionsRange() {
        return Karate.run("transactionRange").relativeTo(getClass());
    }

}

@IsTest
private class RabitE2ESourceClassTest {
    @IsTest
    static void helloReturnsTheFixtureText() {
        System.assertEquals('rabit e2e source', RabitE2ESourceClass.hello());
    }
}
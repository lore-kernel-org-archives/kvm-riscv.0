From: Sean Christopherson <seanjc@google.com>
Date: Wed, 20 Nov 2024 16:29:16 -0800
Subject: [RFC PATCH 0/1] KVM selftests runner for running more than just default
In-Reply-To: <20241115211523.GB599524.vipinsh@google.com>
References: <20240821223012.3757828-1-vipinsh@google.com> <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
 <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
 <ZyuiH_CVQqJUoSB-@google.com> <20241108-eaacad12f1eef31481cf0c6c@orel>
 <ZzY2iAqNfeiiIGys@google.com> <20241115211523.GB599524.vipinsh@google.com>
Message-ID: <Zz5-3A36cckhYu9K@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 15, 2024, Vipin Sharma wrote:
> On 2024-11-14 09:42:32, Sean Christopherson wrote:
> > On Fri, Nov 08, 2024, Andrew Jones wrote:
> > > On Wed, Nov 06, 2024 at 09:06:39AM -0800, Sean Christopherson wrote:
> > > > On Fri, Nov 01, 2024, Vipin Sharma wrote:
> > > > > Phase 3: Provide collection of interesting configurations
> > > > > 
> > > > > Specific individual constructs can be combined in a meaningful way to
> > > > > provide interesting configurations to run on a platform. For example,
> > > > > user doesn't need to specify each individual configuration instead,
> > > > > some prebuilt configurations can be exposed like
> > > > > --stress_test_shadow_mmu, --test_basic_nested
> > > > 
> > > > IMO, this shouldn't be baked into the runner, i.e. should not surface as dedicated
> > > > command line options.  Users shouldn't need to modify the runner just to bring
> > > > their own configuration.  I also think configurations should be discoverable,
> > > > e.g. not hardcoded like KUT's unittest.cfg.  A very real problem with KUT's
> > > > approach is that testing different combinations is frustratingly difficult,
> > > > because running a testcase with different configuration requires modifying a file
> > > > that is tracked by git.
> 
> I was thinking of folks who send upstream patches, they might not have
> interesting configurations to run to test. If we don't provide an option
> then they might not be able to test different scenarios.

Yeah, I'm not saying upstream can't provide testcases, just that the existence of
testcases shouldn't be hardcoded into the runner.

> I do agree command line option might not be a great choice here, we
> should keep them granular.
> 
> What if there is a shell script which has some runner commands with
> different combinations? There should be a default configuration provided
> to ease testing of patches for folks who might not be aware of the
> configurations which maintainers generally use.
> 
> End goal is to provide good confidence to the patch submitter that they have
> done good testing.

As discussed off-list, I think having one testcase per file is the way to go.

  - Very discoverable (literally files)
  - The user (or a shell script) can use regexes, globbing, etc., to select which
    tests to run
  - Creating "suites" is similarly easy, e.g. by having a list of files/testscase,
    or maybe by directory layout

Keeping track of testcases (and their content), e.g. to avoid duplicates, might
be an issue, but I think we can mitigate that by establishing and following
guidelines for naming, e.g. so that the name of a testcase gives the user a
decent idea of what it does.

> > > Could also use an environment variable to specify a file which contains
> > > a config in a test-specific format if parsing environment variables is
> > > insufficient or awkward for configuring a test.
> > 
> > There's no reason to use a environment variable for this.  If we want to support
> > "advanced" setup via a test configuration, then that can simply go in configuration
> > file that's passed to the runner.
> 
> Can you guys specify What does this test configuration file/directory
> will look like? Also, is it gonna be a one file for one test? This might
> become ugly soon.

As above, I like the idea of one file per testcase.  I'm not anticipating thousands
of tests.  Regardless of how we organize things, mentally keeping track of that
many tests would be extremely difficult.  E.g. testcases would likely bitrot and/or
we'd end up with a lot of overlap.  And if we do get anywhere near that number of
testcases, they'll need to be organzied in some way.

One idea would be create a directory per KVM selftest, and then put testcases for
that test in said directory.  We could even do something clever like fail the
build if a test doesn't have a corresponding directory (and a default testcase?).

E.g. tools/testing/selftests/kvm/testcases, with sub-directories following the
tests themsleves and separated by architecture as appropriate.

That us decent organization.  If each test has a testcase directory, it's easy to
get a list of testcases.  At that point, the name of the testcase can be used to
organize and describe, e.g. by tying the name to the (most interesting) parameters.

Hmm, and for collections of multiple testscases, what if we added a separate
"testsuites" directory, with different syntax?  E.g. one file per testuite, which
is basically a list of testcases.  Maybe with some magic to allow testsuites to
"include" arch specific info?

E.g. something like this

$ tree test*
testcases
??? max_guest_memory_test
    ??? 128gib.allvcpus.test
testsuites
??? mmu.suite

3 directories, 2 files
$ cat testsuites/mmu.suite 
$ARCH/mmu.suite
max_guest_memory_test/128gib.allvcpus.test

> This brings the question on how to handle the test execution when we are using
> different command line parameters for individual tests which need some
> specific environmnet?
> 
> Some parameters will need a very specific module or sysfs setting which
> might conflict with other tests. This is why I had "test_suite" in my
> json, which can provide some module, sysfs, or other host settings. But
> this also added cost of duplicating tests for each/few suites.

IMO, this should be handled by user, or their CI environment, not by the upstream
runner.  Reconfiguring module params or sysfs knobs is inherently environment
specific.  E.g. not all KVM module params are writable post-load, and so changing
a param might require stopping all VMs on the system, or even a full kernel reboot
if KVM is built-in.  There may also be knobs that require root access, that are
dependent on hardware and/or kernel config, etc.

I really don't want to build all that into the upstream test runner, certainly not
in the first few phases.  I 100% think the runner should be constructed in such a
way that people/organizations/CI pipeines can build infrastructure on top, I just
don't think it's a big need or a good fit for upstream.

> I guess the shell script I talked about few paragraphs above, can have
> some specific runner invocations which will set specific requirements of
> the test and execute that specific test (RFC runner has the capabilty to execute
> specific test).
> 
> Open to suggestions on a better approach.


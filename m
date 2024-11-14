From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Nov 2024 09:42:32 -0800
Subject: [RFC PATCH 0/1] KVM selftests runner for running more than just default
In-Reply-To: <20241108-eaacad12f1eef31481cf0c6c@orel>
References: <20240821223012.3757828-1-vipinsh@google.com> <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
 <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
 <ZyuiH_CVQqJUoSB-@google.com> <20241108-eaacad12f1eef31481cf0c6c@orel>
Message-ID: <ZzY2iAqNfeiiIGys@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 08, 2024, Andrew Jones wrote:
> On Wed, Nov 06, 2024 at 09:06:39AM -0800, Sean Christopherson wrote:
> > On Fri, Nov 01, 2024, Vipin Sharma wrote:
> > > Phase 3: Provide collection of interesting configurations
> > > 
> > > Specific individual constructs can be combined in a meaningful way to
> > > provide interesting configurations to run on a platform. For example,
> > > user doesn't need to specify each individual configuration instead,
> > > some prebuilt configurations can be exposed like
> > > --stress_test_shadow_mmu, --test_basic_nested
> > 
> > IMO, this shouldn't be baked into the runner, i.e. should not surface as dedicated
> > command line options.  Users shouldn't need to modify the runner just to bring
> > their own configuration.  I also think configurations should be discoverable,
> > e.g. not hardcoded like KUT's unittest.cfg.  A very real problem with KUT's
> > approach is that testing different combinations is frustratingly difficult,
> > because running a testcase with different configuration requires modifying a file
> > that is tracked by git.
> 
> We have support in KUT for environment variables (which are stored in an
> initrd). The feature hasn't been used too much, but x86 applies it to
> configuration parameters needed to execute tests from grub, arm uses it
> for an errata framework allowing tests to run on kernels which may not
> include fixes to host-crashing bugs, and riscv is using them quite a bit
> for providing test parameters and test expected results in order to allow
> SBI tests to be run on a variety of SBI implementations. The environment
> variables are provided in a text file which is not tracked by git. kvm
> selftests can obviously also use environment variables by simply sourcing
> them first in wrapper scripts for the tests.

Oh hell no! :-)

For reproducibility, transparency, determinism, environment variables are pure
evil.  I don't want to discover that I wasn't actually testing what I thought I
was testing because I forgot to set/purge an environment variable.  Ditto for
trying to reproduce a failure reported by someone.

KUT's usage to adjust to the *system* environment is somewhat understandable
But for KVM selftests, there should be absolutely zero reason to need to fall
back to environment variables.  Unlike KUT, which can run in a fairly large variety
of environments, e.g. bare metal vs. virtual, different VMMs, different firmware,
etc., KVM selftests effectively support exactly one environment.

And unlike KUT, KVM selftests are tightly coupled to the kernel.  Yes, it's very
possible to run selftests against different kernels, but I don't think we should
go out of our way to support such usage.  And if an environment needs to skip a
test, it should be super easy to do so if we decouple the test configuration
inputs from the test runner.

> > There are underlying issues with KUT that essentially necessitate that approach,
> > e.g. x86 has several testcases that fail if run without the exact right config.
> > But that's just another reason to NOT follow KUT's pattern, e.g. to force us to
> > write robust tests.
> > 
> > E.g. instead of per-config command line options, let the user specify a file,
> > and/or a directory (using a well known filename pattern to detect configs).
> 
> Could also use an environment variable to specify a file which contains
> a config in a test-specific format if parsing environment variables is
> insufficient or awkward for configuring a test.

There's no reason to use a environment variable for this.  If we want to support
"advanced" setup via a test configuration, then that can simply go in configuration
file that's passed to the runner.


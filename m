From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 21 Apr 2023 00:36:48 +0800
Subject: [PATCH -next v18 00/20] riscv: Add vector ISA support
In-Reply-To: <mhng-607b5023-8f07-4a82-b292-35078123e9e8@palmer-ri-x1c9>
References: <87leinq5wg.fsf@all.your.base.are.belong.to.us> <mhng-607b5023-8f07-4a82-b292-35078123e9e8@palmer-ri-x1c9>
Message-ID: <CABgGipWbSFnAK=DwT9X2esPBVTi0p+Oft1NyWbZ60LOwHj4dgA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 19, 2023 at 11:18?PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 19 Apr 2023 07:54:23 PDT (-0700), bjorn at kernel.org wrote:
> > Bj?rn T?pel <bjorn@kernel.org> writes:
> >
> >> Andy Chiu <andy.chiu@sifive.com> writes:
> >>
> >>> This patchset is implemented based on vector 1.0 spec to add vector support
> >>> in riscv Linux kernel. There are some assumptions for this implementations.
> >>>
> >>> 1. We assume all harts has the same ISA in the system.
> >>> 2. We disable vector in both kernel and user space [1] by default. Only
> >>>    enable an user's vector after an illegal instruction trap where it
> >>>    actually starts executing vector (the first-use trap [2]).
> >>> 3. We detect "riscv,isa" to determine whether vector is support or not.
> >>>
> >>> We defined a new structure __riscv_v_ext_state in struct thread_struct to
> >>> save/restore the vector related registers. It is used for both kernel space
> >>> and user space.
> >>>  - In kernel space, the datap pointer in __riscv_v_ext_state will be
> >>>    allocated to save vector registers.
> >>>  - In user space,
> >>>     - In signal handler of user space, the structure is placed
> >>>       right after __riscv_ctx_hdr, which is embedded in fp reserved
> >>>       aera. This is required to avoid ABI break [2]. And datap points
> >>>       to the end of __riscv_v_ext_state.
> >>>     - In ptrace, the data will be put in ubuf in which we use
> >>>       riscv_vr_get()/riscv_vr_set() to get or set the
> >>>       __riscv_v_ext_state data structure from/to it, datap pointer
> >>>       would be zeroed and vector registers will be copied to the
> >>>       address right after the __riscv_v_ext_state structure in ubuf.
> >>>
> >>> This patchset is rebased to v6.3-rc1 and it is tested by running several
> >>> vector programs simultaneously. It delivers signals correctly in a test
> >>> where we can see a valid ucontext_t in a signal handler, and a correct V
> >>> context returing back from it. And the ptrace interface is tested by
> >>> PTRACE_{GET,SET}REGSET. Lastly, KVM is tested by running above tests in
> >>> a guest using the same kernel image. All tests are done on an rv64gcv
> >>> virt QEMU.
> >>>
> >>> Note: please apply the patch at [4] due to a regression introduced by
> >>> commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> >>> optimizations") before testing the series.
> >>>
> >>> Source tree:
> >>> https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v18
> >>
> >> After some offlist discussions, we might have a identified a
> >> potential libc->application ABI break.
> >>
> >> Given an application that does custom task scheduling via a signal
> >> handler. The application binary is not vector aware, but libc is. Libc
> >> is using vector registers for memcpy. It's an "old application, new
> >> library, new kernel"-scenario.
> >>
> >>  | ...
> >>  | struct context *p1_ctx;
> >>  | struct context *p2_ctx;
> >>  |
> >>  | void sighandler(int sig, siginfo_t *info, void *ucontext)
> >>  | {
> >>  |   if (p1_running)
> >>  |     switch_to(p1_ctx, p2_ctx);
> >>  |   if (p2_running)
> >>  |     switch_to(p2_ctx, p1_ctx);
> >>  | }
> >>  |
> >>  | void p1(void)
> >>  | {
> >>  |   memcpy(foo, bar, 17);
> >>  | }
> >>  |
> >>  | void p2(void)
> >>  | {
> >>  |   ...
> >>  | }
> >>  | ...
> >>
> >> The switch_to() function schedules p1() and p2(). E.g., the
> >> application (assumes that it) saves the complete task state from
> >> sigcontext (ucontext) to p1_ctx, and restores sigcontext to p2_ctx, so
> >> when sigreturn is called, p2() is running, and p1() has been
> >> interrupted.
> >>
> >> The "old application" which is not aware of vector, is now run on a
> >> vector enabled kernel/glibc.
> >>
> >> Assume that the sighandler is hit, and p1() is in the middle of the
> >> vector memcpy. The switch_to() function will not save the vector
> >> state, and next time p2() is scheduled to run it will have incorrect
> >> machine state.
>
> Thanks for writing this up, and sorry I've dropped the ball a few times on
> describing it.
>
> >> Now:
> >>
> >> Is this an actual or theoretical problem (i.e. are there any
> >> applications in the wild)? I'd be surprised if it would not be the
> >> latter...
>
> I also have no idea.  It's kind of odd to say "nobody cares about the
> ABI break" when we can manifest it with some fairly simple example, but
> I'd bet that nobody cares.
>
> >> Regardless, a kernel knob for disabling vector (sysctl/prctl) to avoid
> >> these kind of breaks is needed (right?). Could this knob be a
> >> follow-up patch to the existing v18 series?
> >>
> >> Note that arm64 does not suffer from this with SVE, because the default
> >> vector length (vl==0/128b*32) fits in the "legacy" sigcontext.
> >
> > Andy, to clarify from the patchwork call; In
> > Documentation/arm64/sve.rst:
> >
> > There's a per-process prctl (section 6), and a system runtime conf
> > (section 9).

Thanks for pointing me out!

>
> I think if we want to play it safe WRT the ABI break, then we can
> essentially just do the same thing.  It'll be a much bigger cliff for us
> because we have no space for the V extension, but that was just a
> mistake and there's nothing we can do about it.

I understand the concern. It is good to provide a way to have explicit
controls of Vector rather than do nothing if such ABI break happens.
As for implementation details, do you think a system-wide  sysctl
alone is enough? Or, do we also need a prctl for per-process control?

>
> > Bj?rn


From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Wed, 26 Apr 2023 07:27:50 -0700 (PDT)
Subject: [PATCH -next v18 00/20] riscv: Add vector ISA support
In-Reply-To: <CABgGipWbSFnAK=DwT9X2esPBVTi0p+Oft1NyWbZ60LOwHj4dgA@mail.gmail.com>
Message-ID: <mhng-47aa965a-2b25-4ac0-984a-c2e6f3a051ee@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 20 Apr 2023 09:36:48 PDT (-0700), andy.chiu at sifive.com wrote:
> On Wed, Apr 19, 2023 at 11:18?PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 19 Apr 2023 07:54:23 PDT (-0700), bjorn at kernel.org wrote:
>> > Bj?rn T?pel <bjorn@kernel.org> writes:
>> >
>> >> Andy Chiu <andy.chiu@sifive.com> writes:
>> >>
>> >>> This patchset is implemented based on vector 1.0 spec to add vector support
>> >>> in riscv Linux kernel. There are some assumptions for this implementations.
>> >>>
>> >>> 1. We assume all harts has the same ISA in the system.
>> >>> 2. We disable vector in both kernel and user space [1] by default. Only
>> >>>    enable an user's vector after an illegal instruction trap where it
>> >>>    actually starts executing vector (the first-use trap [2]).
>> >>> 3. We detect "riscv,isa" to determine whether vector is support or not.
>> >>>
>> >>> We defined a new structure __riscv_v_ext_state in struct thread_struct to
>> >>> save/restore the vector related registers. It is used for both kernel space
>> >>> and user space.
>> >>>  - In kernel space, the datap pointer in __riscv_v_ext_state will be
>> >>>    allocated to save vector registers.
>> >>>  - In user space,
>> >>>     - In signal handler of user space, the structure is placed
>> >>>       right after __riscv_ctx_hdr, which is embedded in fp reserved
>> >>>       aera. This is required to avoid ABI break [2]. And datap points
>> >>>       to the end of __riscv_v_ext_state.
>> >>>     - In ptrace, the data will be put in ubuf in which we use
>> >>>       riscv_vr_get()/riscv_vr_set() to get or set the
>> >>>       __riscv_v_ext_state data structure from/to it, datap pointer
>> >>>       would be zeroed and vector registers will be copied to the
>> >>>       address right after the __riscv_v_ext_state structure in ubuf.
>> >>>
>> >>> This patchset is rebased to v6.3-rc1 and it is tested by running several
>> >>> vector programs simultaneously. It delivers signals correctly in a test
>> >>> where we can see a valid ucontext_t in a signal handler, and a correct V
>> >>> context returing back from it. And the ptrace interface is tested by
>> >>> PTRACE_{GET,SET}REGSET. Lastly, KVM is tested by running above tests in
>> >>> a guest using the same kernel image. All tests are done on an rv64gcv
>> >>> virt QEMU.
>> >>>
>> >>> Note: please apply the patch at [4] due to a regression introduced by
>> >>> commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
>> >>> optimizations") before testing the series.
>> >>>
>> >>> Source tree:
>> >>> https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v18
>> >>
>> >> After some offlist discussions, we might have a identified a
>> >> potential libc->application ABI break.
>> >>
>> >> Given an application that does custom task scheduling via a signal
>> >> handler. The application binary is not vector aware, but libc is. Libc
>> >> is using vector registers for memcpy. It's an "old application, new
>> >> library, new kernel"-scenario.
>> >>
>> >>  | ...
>> >>  | struct context *p1_ctx;
>> >>  | struct context *p2_ctx;
>> >>  |
>> >>  | void sighandler(int sig, siginfo_t *info, void *ucontext)
>> >>  | {
>> >>  |   if (p1_running)
>> >>  |     switch_to(p1_ctx, p2_ctx);
>> >>  |   if (p2_running)
>> >>  |     switch_to(p2_ctx, p1_ctx);
>> >>  | }
>> >>  |
>> >>  | void p1(void)
>> >>  | {
>> >>  |   memcpy(foo, bar, 17);
>> >>  | }
>> >>  |
>> >>  | void p2(void)
>> >>  | {
>> >>  |   ...
>> >>  | }
>> >>  | ...
>> >>
>> >> The switch_to() function schedules p1() and p2(). E.g., the
>> >> application (assumes that it) saves the complete task state from
>> >> sigcontext (ucontext) to p1_ctx, and restores sigcontext to p2_ctx, so
>> >> when sigreturn is called, p2() is running, and p1() has been
>> >> interrupted.
>> >>
>> >> The "old application" which is not aware of vector, is now run on a
>> >> vector enabled kernel/glibc.
>> >>
>> >> Assume that the sighandler is hit, and p1() is in the middle of the
>> >> vector memcpy. The switch_to() function will not save the vector
>> >> state, and next time p2() is scheduled to run it will have incorrect
>> >> machine state.
>>
>> Thanks for writing this up, and sorry I've dropped the ball a few times on
>> describing it.
>>
>> >> Now:
>> >>
>> >> Is this an actual or theoretical problem (i.e. are there any
>> >> applications in the wild)? I'd be surprised if it would not be the
>> >> latter...
>>
>> I also have no idea.  It's kind of odd to say "nobody cares about the
>> ABI break" when we can manifest it with some fairly simple example, but
>> I'd bet that nobody cares.
>>
>> >> Regardless, a kernel knob for disabling vector (sysctl/prctl) to avoid
>> >> these kind of breaks is needed (right?). Could this knob be a
>> >> follow-up patch to the existing v18 series?
>> >>
>> >> Note that arm64 does not suffer from this with SVE, because the default
>> >> vector length (vl==0/128b*32) fits in the "legacy" sigcontext.
>> >
>> > Andy, to clarify from the patchwork call; In
>> > Documentation/arm64/sve.rst:
>> >
>> > There's a per-process prctl (section 6), and a system runtime conf
>> > (section 9).
>
> Thanks for pointing me out!
>
>>
>> I think if we want to play it safe WRT the ABI break, then we can
>> essentially just do the same thing.  It'll be a much bigger cliff for us
>> because we have no space for the V extension, but that was just a
>> mistake and there's nothing we can do about it.
>
> I understand the concern. It is good to provide a way to have explicit
> controls of Vector rather than do nothing if such ABI break happens.
> As for implementation details, do you think a system-wide  sysctl
> alone is enough? Or, do we also need a prctl for per-process control?

A few of us were talking in the patchwork meeting.  It's kind of a grey 
area here, but we're just going to play it safe and wait for the 
prctl and sys interfaces to show up before merging this.

I know it's a pain to have to wait another release, but there's still no 
publicly availiable V hardware yet so waiting isn't concretely impacting 
users right now.  If we flip on V now we probably won't get a ton of 
testing, so we risk the ABI break sticking around for a few release 
which would be a huge headache.

Andy said he'd be able to do the prtcl and sys interfaces pretty 
quickly, so hopfully everything's lined up for the next release.

>> > Bj?rn


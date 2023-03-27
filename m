From: Björn Töpel <bjorn@kernel.org>
Date: Mon, 27 Mar 2023 08:21:22 +0200
Subject: [PATCH -next v16 00/20] riscv: Add vector ISA support
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
Message-ID: <87tty6ww7x.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> This patchset is implemented based on vector 1.0 spec to add vector support
> in riscv Linux kernel. There are some assumptions for this implementations.
>
> 1. We assume all harts has the same ISA in the system.
> 2. We disable vector in both kernel andy user space [1] by default. Only
>    enable an user's vector after an illegal instruction trap where it
>    actually starts executing vector (the first-use trap [2]).
> 3. We detect "riscv,isa" to determine whether vector is support or not.
>
> We defined a new structure __riscv_v_ext_state in struct thread_struct to
> save/restore the vector related registers. It is used for both kernel space
> and user space.
>  - In kernel space, the datap pointer in __riscv_v_ext_state will be
>    allocated to save vector registers.
>  - In user space,
> 	- In signal handler of user space, the structure is placed
> 	  right after __riscv_ctx_hdr, which is embedded in fp reserved
> 	  aera. This is required to avoid ABI break [2]. And datap points
> 	  to the end of __riscv_v_ext_state.
> 	- In ptrace, the data will be put in ubuf in which we use
> 	  riscv_vr_get()/riscv_vr_set() to get or set the
> 	  __riscv_v_ext_state data structure from/to it, datap pointer
> 	  would be zeroed and vector registers will be copied to the
> 	  address right after the __riscv_v_ext_state structure in ubuf.
>
> This patchset is rebased to v6.3-rc1 and it is tested by running several
> vector programs simultaneously. It delivers signals correctly in a test
> where we can see a valid ucontext_t in a signal handler, and a correct V
> context returing back from it. And the ptrace interface is tested by
> PTRACE_{GET,SET}REGSET. Lastly, KVM is tested by running above tests in
> a guest using the same kernel image. All tests are done on an rv64gcv
> virt QEMU.
>
> Note: please apply the patch at [4] due to a regression introduced by
> commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> optimizations") before testing the series.
>
> Specail thanks to Conor and Vineet for kindly giving help on- and off-list.
>
> Source tree:
> https://github.com/sifive/riscv-linux/tree/riscv/for-next/vector-v16
>
> Links:
>  - [1] https://lore.kernel.org/all/20220921214439.1491510-17-stillson at rivosinc.com/
>  - [2] https://lore.kernel.org/all/73c0124c-4794-6e40-460c-b26df407f322 at rivosinc.com/T/#u
>  - [3] https://lore.kernel.org/all/20230128082847.3055316-1-apatel at ventanamicro.com/
>  - [4] https://lore.kernel.org/all/CAHk-=wiAxtKyxs6BPEzirrXw1kXJ-7ZyGpgOrbzhmC=ud-6jBA at mail.gmail.com/
> ---
> Changelog V16
>  - Rebase to the latest for-next:
>    - Solve conflicts at 7, and 17
>  - Use as-instr to detect if assembler supports .option arch directive
>    and remove dependency from GAS, for both ZBB and V.
>  - Cleanup code in KVM vector
>  - Address issue reported by sparse
>  - Refine code:
>    - Fix a mixed-use of space/tab
>    - Remove new lines at the end of file

Andy,

The generic entry series was applied to for-next, which conflicts with
yours. One more spin... :-(

https://patchwork.kernel.org/project/linux-riscv/patch/20230323145924.4194-2-andy.chiu at sifive.com/


Bj?rn


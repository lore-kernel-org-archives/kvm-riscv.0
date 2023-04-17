From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Mon, 17 Apr 2023 16:56:58 +0100
Subject: [PATCH -next v18 00/20] riscv: Add vector ISA support
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
Message-ID: <eae19ece-0d56-a91c-3417-f00b9b71f04d@codethink.co.uk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14/04/2023 16:58, Andy Chiu wrote:
> This patchset is implemented based on vector 1.0 spec to add vector support
> in riscv Linux kernel. There are some assumptions for this implementations.
> 
> 1. We assume all harts has the same ISA in the system.
> 2. We disable vector in both kernel and user space [1] by default. Only
>     enable an user's vector after an illegal instruction trap where it
>     actually starts executing vector (the first-use trap [2]).
> 3. We detect "riscv,isa" to determine whether vector is support or not.
> 
> We defined a new structure __riscv_v_ext_state in struct thread_struct to
> save/restore the vector related registers. It is used for both kernel space
> and user space.
>   - In kernel space, the datap pointer in __riscv_v_ext_state will be
>     allocated to save vector registers.
>   - In user space,
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

Ok, are there plans for in-kernel vector patches, or have I missed
something in this list? I expect once things like the vector-crypto
hit then people will be wanting in-kernel accelerators.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html



From: Rob Herring <robh@kernel.org>
Date: Mon, 6 Dec 2021 09:28:13 -0600
Subject: [RFC 0/6] Sparse HART id support
In-Reply-To: <20211204002038.113653-1-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
Message-ID: <Ya4sDX974/dVEOQw@robh.at.kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 03, 2021 at 04:20:32PM -0800, Atish Patra wrote:
> Currently, sparse hartid is not supported for Linux RISC-V for the following
> reasons.
> 1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
>    which is an array size of NR_CPUs.
> 2. During early booting, any hartid greater than NR_CPUs are not booted at all.
> 3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
> 4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
>    generating hartmask.
> 
> In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
> which was logically incorrect anyways. NR_CPUs represent the maximum logical|
> CPU id configured in the kernel while the hartid represent the physical hartid
> stored in mhartid CSR defined by the privilege specification. Thus, hartid
> can have much greater value than logical cpuid.

We already have a couple of architectures with logical to physical CPU 
id maps. See cpu_logical_map. Can we make that common and use it here? 
That would also possibly allow for common populating the map from DT.

Rob


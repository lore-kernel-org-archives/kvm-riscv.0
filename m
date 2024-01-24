From: Thomas Huth <thuth@redhat.com>
Date: Wed, 24 Jan 2024 10:58:34 +0100
Subject: [kvm-unit-tests PATCH 00/24] Introduce RISC-V
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <5f8a77b9-1b6b-4319-b4b8-ea11ede43cb9@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24/01/2024 08.18, Andrew Jones wrote:
> This series adds another architecture to kvm-unit-tests (RISC-V, both
> 32-bit and 64-bit). Much of the code is borrowed from arm/arm64 by
> mimicking its patterns or by first making the arm code more generic
> and moving it to the common lib.
> 
> This series brings UART, SMP, MMU, and exception handling support.
> One should be able to start writing CPU validation tests in a mix
> of C and asm as well as write SBI tests, as is the plan for the SBI
> verification framework. kvm-unit-tests provides backtraces on asserts
> and input can be given to the tests through command line arguments,
> environment variables, and the DT (there's already an ISA string
> parser for extension detection).
> 
> This series only targets QEMU TCG and KVM, but OpenSBI may be replaced
> with other SBI implementations, such as RustSBI. It's a goal to target
> bare-metal as soon as possible, so EFI support is already in progress
> and will be posted soon. More follow on series will come as well,
> bringing interrupt controller support for timer and PMU testing,
> support to run tests in usermode, and whatever else people need for
> their tests.

I can't say much about the riscv details, but I very quickly skimmed through 
the series and I'm fine if we add that to the k-u-t, so FWIW:

Series
Acked-by: Thomas Huth <thuth@redhat.com>



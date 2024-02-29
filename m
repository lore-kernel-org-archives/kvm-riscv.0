From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 29 Feb 2024 12:54:02 +0100
Subject: [kvm-unit-tests PATCH 04/13] treewide: lib/stack: Make
 base_address arch specific
In-Reply-To: <CZH98WKJY6NT.5D53XGR31X22@wheely>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
 <20240228150416.248948-19-andrew.jones@linux.dev>
 <CZH98WKJY6NT.5D53XGR31X22@wheely>
Message-ID: <20240229-edee610a9d15912f1f349ea0@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 29, 2024 at 01:49:58PM +1000, Nicholas Piggin wrote:
> On Thu Feb 29, 2024 at 1:04 AM AEST, Andrew Jones wrote:
> > Calculating the offset of an address is image specific, which is
> > architecture specific. Until now, all architectures and architecture
> > configurations which select CONFIG_RELOC were able to subtract
> > _etext, but the EFI configuration of riscv cannot (it must subtract
> > ImageBase). Make this function architecture specific, since the
> > architecture's image layout already is.
> 
> arch_base_address()?

Yeah, I should have added that prefix.

> 
> How about a default implementation unlesss HAVE_ARCH_BASE_ADDRESS?

We have a default implementation for !CONFIG_RELOC, but if an arch
selects RELOC it must have an implementation of base_address(), so
I wouldn't introduce a HAVE_ARCH_BASE_ADDRESS type of config since
it would just always be selected when RELOC is selected. It occurred
to me after posting that I probably should have just made the current
base_address() implementation weak and then only introduced the new
riscv one. I'll do that for v2.

Thanks,
drew


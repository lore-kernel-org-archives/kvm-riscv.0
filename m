From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 Apr 2024 09:38:41 +0200
Subject: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space
 if perf event failed
In-Reply-To: <7d02c86e-8c36-4e78-9fa8-5e30f3431eb3@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-8-atishp@rivosinc.com>
 <20240302-1a3c0df25f2422e1e6abecf3@orel>
 <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
 <20240404-ea40bc0237635d671e64fef6@orel>
 <7d02c86e-8c36-4e78-9fa8-5e30f3431eb3@rivosinc.com>
Message-ID: <20240411-6fe47ccc32d9cb7baa121b4d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 03:44:32PM -0700, Atish Patra wrote:
> On 4/4/24 05:16, Andrew Jones wrote:
> > On Mon, Apr 01, 2024 at 03:37:01PM -0700, Atish Patra wrote:
> > > On Sat, Mar 2, 2024 at 12:16?AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > 
> > > > On Wed, Feb 28, 2024 at 05:01:22PM -0800, Atish Patra wrote:
> > > > > Currently, we return a linux error code if creating a perf event failed
> > > > > in kvm. That shouldn't be necessary as guest can continue to operate
> > > > > without perf profiling or profiling with firmware counters.
> > > > > 
> > > > > Return appropriate SBI error code to indicate that PMU configuration
> > > > > failed. An error message in kvm already describes the reason for failure.
> > > > 
> > > > I don't know enough about the perf subsystem to know if there may be
> > > > a concern that resources are temporarily unavailable. If so, then this
> > > 
> > > Do you mean the hardware resources unavailable because the host is using it ?
> > 
> > Yes (I think). The issue I'm thinking of is if kvm_pmu_create_perf_event
> > (perf_event_create_kernel_counter) returns something like EBUSY and then
> > we translate that to SBI_ERR_NOT_SUPPORTED. I'm not sure guests would
> > interpret not-supported as an error which means they can retry. Or if
> > they retry and get something other than not-supported if they'd be
> > confused.
> > 
> 
> At least in Linux driver, treats -ENOTSUPP and it just fails. Other guest OS
> implementation may interpret it differently. But they should fail at that
> point as well. I don't see how can they interpret to be retry.
> 
> The perf user can retry again with assumption that may be enough counters
> are not available at this moment. But that's different from return a retry
> from driver code.
> 
> Even if we support a retry error code, when does the caller retry it ?
> The driver doesn't know how long the user is going to run the perf command
> to keep the hardware resources occupied.
> 
> I feel the perf user is the best entity to know that and should retry if it
> knows the previous run is over which might have released the hardware
> resources.

I agree, but how does the user know that retrying makes sense? I presume
-ENOTSUPP will get propagated all the way to the user in a form that
means "not supported". Or, can the user list all resources and then
when they see "not supported" know that means "not supported at the
moment", as they've already seen that the resources exist?

Anyway, as I said, I don't know enough about the perf subsystem to know
if this is a real concern or not, but it sort of looks like we have
potential to tell users that something isn't supported when in fact it
is supported, but only temporarily unavailable.

Thanks,
drew


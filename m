From: Xiaoyao Li <xiaoyao.li@intel.com>
Date: Thu, 2 Nov 2023 10:19:50 +0800
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
In-Reply-To: <ZUKMsOdg3N9wmEzy@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
 <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
 <ZUKMsOdg3N9wmEzy@google.com>
Message-ID: <33686031-c1df-4ef5-a6ac-1aab7f5c656e@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/2/2023 1:36 AM, Sean Christopherson wrote:
>> KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
>> <asm/kvm_host.h>?
> I'd prefer to keep it in generic code, as it's highly likely to end up there
> sooner than later.  There's a known use case for ARM (exit to userspace on missing
> userspace mapping[*]), and I'm guessing pKVM (also ARM) will also utilize this API.
> 
> [*]https://lore.kernel.org/all/20230908222905.1321305-8-amoorthy at google.com

I wonder how this CAP is supposed to be checked in userspace, for guest 
memfd case? something like this?

	if (!kvm_check_extension(s, KVM_CAP_MEMORY_FAULT_INFO) &&
	    run->exit_reason == KVM_EXIT_MEMORY_FAULT)
		abort("unexpected KVM_EXIT_MEMORY_FAULT");

In my implementation of QEMU patches, I find it's unnecessary. When 
userspace gets an exit with KVM_EXIT_MEMORY_FAULT, it implies 
"KVM_CAP_MEMORY_FAULT_INFO".

So I don't see how it is necessary in this series. Whether it's 
necessary or not for [*], I don't have the answer but we can leave the 
discussion to that patch series.


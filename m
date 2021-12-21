From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Dec 2021 18:23:06 +0100
Subject: [PATCH] KVM: selftests: Fix compile error for non-x86
 vm_compute_max_gfn()
In-Reply-To: <3e3b5295-f6fb-1ff9-acfe-1a4c47c6ba20@linuxfoundation.org>
References: <20211221125617.932371-1-anup.patel@wdc.com>
 <3e3b5295-f6fb-1ff9-acfe-1a4c47c6ba20@linuxfoundation.org>
Message-ID: <4d739c28-e07d-f921-8a8d-a5343139e234@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/21/21 18:22, Shuah Khan wrote:
> On 12/21/21 5:56 AM, Anup Patel wrote:
>> The inline version of vm_compute_max_gfn() in kvm_util.h directly
>> access members of "struct kvm_vm" which causes compile errors for
>> non-x86 architectures because lib/elf.c includes "kvm_util.h" before
>> "kvm_util_internal.h".
>>
>> This patch fixes above described compile error by converting inline
>> version of vm_compute_max_gfn() into a macro.
> 
> Thank you for the patch. Please include the actual compile error in the
> change log and send v2,

Hi, a similar patch is already queued and should get to Linus today or 
tomorrow.

Paolo



From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Nov 2021 16:50:23 +0100
Subject: [PATCH 1/5] KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
In-Reply-To: <87y25onsj6.fsf@redhat.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <20211111162746.100598-2-vkuznets@redhat.com>
 <a5cdff6878b7157587e92ebe4d5af362@kernel.org> <875ysxg0s1.fsf@redhat.com>
 <87k0hd8obo.wl-maz@kernel.org>
 <ad3534bc-fe3a-55f5-b022-4dbec5f29798@redhat.com> <87y25onsj6.fsf@redhat.com>
Message-ID: <ebfa56a6-d444-e82e-bf0d-946765c7f8ae@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/16/21 14:23, Vitaly Kuznetsov wrote:
> (I'm about to send v2 as we have s390 sorted out.)
> 
> So what do we decide about ARM?
> - Current approach (kvm->arch.max_vcpus/kvm_arm_default_max_vcpus()
>   depending on 'if (kvm)') - that would be my preference.

That would be mine too.

Paolo

> - Always kvm_arm_default_max_vcpus to make the output independent on 'if
>   (kvm)'.
> - keep the status quo (drop the patch).



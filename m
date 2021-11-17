From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 17 Nov 2021 13:07:41 +0100
Subject: [PATCH v2 1/6] KVM: arm64: Cap KVM_CAP_NR_VCPUS by
 kvm_arm_default_max_vcpus()
In-Reply-To: <20211116163443.88707-2-vkuznets@redhat.com>
References: <20211116163443.88707-1-vkuznets@redhat.com>
 <20211116163443.88707-2-vkuznets@redhat.com>
Message-ID: <539f71a6-f62a-c7d2-51a8-bd062a639e87@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/16/21 17:34, Vitaly Kuznetsov wrote:
> -		r = num_online_cpus();
> +		/*
> +		 * ARM64 treats KVM_CAP_NR_CPUS differently from all other
> +		 * architectures, as it does not always bound it to
> +		 * num_online_cpus(). It should not matter much because this
                   ^^^^^^^^^^^^^^^^^^

KVM_CAP_MAX_VCPUS (sorry for the typo in my suggestion).  I'll fix it 
when applying.

Paolo

> +		 * is just an advisory value.
> +		 */
> +		r = min_t(unsigned int, num_online_cpus(),
> +			  kvm_arm_default_max_vcpus());



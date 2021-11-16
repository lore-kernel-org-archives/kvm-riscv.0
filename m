From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Nov 2021 16:58:36 +0100
Subject: [PATCH 1/5] KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
In-Reply-To: <875yss859c.wl-maz@kernel.org>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <20211111162746.100598-2-vkuznets@redhat.com>
 <a5cdff6878b7157587e92ebe4d5af362@kernel.org> <875ysxg0s1.fsf@redhat.com>
 <87k0hd8obo.wl-maz@kernel.org>
 <ad3534bc-fe3a-55f5-b022-4dbec5f29798@redhat.com> <87y25onsj6.fsf@redhat.com>
 <875yss859c.wl-maz@kernel.org>
Message-ID: <ca25cf55-dcc8-9df4-a286-3c65a26803cd@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/16/21 16:55, Marc Zyngier wrote:
>> - Always kvm_arm_default_max_vcpus to make the output independent on 'if
>>   (kvm)'.
> This. Between two useless numbers, I prefer the one that doesn't
> introduce any userspace visible changes.

Fair enough, I'm not going to override you---but please add a comment 
that says

	/*
	 * arm64 treats KVM_CAP_NR_CPUS different from all other
	 * architectures, as it does not bound it to num_online_cpus().
	 * It should not matter much because this is just an advisory
	 * value.
	 */

or something like that.

Paolo



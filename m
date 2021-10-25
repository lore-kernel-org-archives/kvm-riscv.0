From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Oct 2021 15:48:20 +0200
Subject: [PATCH v2 20/43] KVM: VMX: Skip Posted Interrupt updates if APICv
 is hard disabled
In-Reply-To: <20211009021236.4122790-21-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-21-seanjc@google.com>
Message-ID: <1537b693-80ee-4f9e-2c4e-6e1c62ccca92@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/10/21 04:12, Sean Christopherson wrote:
> +	/* Nothing to do if PI.SN==0 and the vCPU isn't being migrated. */
>   	if (!pi_test_sn(pi_desc) && vcpu->cpu == cpu)
>   		return;

This does not quite say "why", so:

         /* Nothing to do if PI.SN and PI.NDST both have the desired value. */

Paolo



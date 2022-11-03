From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Nov 2022 15:01:21 +0100
Subject: [PATCH 10/44] KVM: VMX: Clean up eVMCS enabling if KVM
 initialization fails
In-Reply-To: <20221102231911.3107438-11-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-11-seanjc@google.com>
Message-ID: <d641088f-87d9-da77-7e98-92d1a9de6493@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/3/22 00:18, Sean Christopherson wrote:
> +static void hv_cleanup_evmcs(void)

This needs to be __init.

Paolo



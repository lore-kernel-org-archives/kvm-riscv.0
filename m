From: Alex Bennée <alex.bennee@linaro.org>
Date: Thu, 01 Aug 2024 10:31:46 +0100
Subject: [PATCH v12 12/84] KVM: Drop @atomic param from gfn=>pfn and
 hva=>pfn APIs
In-Reply-To: <20240726235234.228822-13-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:21 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-13-seanjc@google.com>
Message-ID: <87plqseghp.fsf@draig.linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Drop @atomic from the myriad "to_pfn" APIs now that all callers pass
> "false".
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn?e <alex.bennee@linaro.org>

-- 
Alex Benn?e
Virtualisation Tech Lead @ Linaro


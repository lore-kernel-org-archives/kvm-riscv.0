From: Alex Bennée <alex.bennee@linaro.org>
Date: Fri, 02 Aug 2024 12:03:11 +0100
Subject: [PATCH v12 83/84] KVM: Drop APIs that manipulate "struct page"
 via pfns
In-Reply-To: <20240726235234.228822-84-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:52:32 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-84-seanjc@google.com>
Message-ID: <87jzgzchlc.fsf@draig.linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Remove all kvm_{release,set}_pfn_*() APIs not that all users are gone.

now?

Otherwise:

Reviewed-by: Alex Benn?e <alex.bennee@linaro.org>

-- 
Alex Benn?e
Virtualisation Tech Lead @ Linaro


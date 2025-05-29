Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790FBC5AD49
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kfv88ndq0YYMEu1ie8j8K9/4YycVSuTTvtJRCNsLO6I=; b=k3GtgPS7E9zwdd
	IYDhUCed7atWh0fX00cAFOA3pG4bax6P+j1hwuvo75hWnQKmZCEkLedjfdZA4LLkJTyp8TjKw0rDY
	WtIaRDgiXZ4034hN2QgyraEjN6GQxCUf4EIxsdHCvVlG0yJOMjlukMDkSTtmJtQq5CvuatTIyyp6E
	2DL//oNGwxOyzP76GW3aejAEsMZL13qWH1f6vr5FpVTXl/fnkJWCft6fXHJCVgjs36QRoJ8tKd5TP
	keJMJR7h8D6l/JF6GkL9y+NB04vT70jnPa3IwVfkdDAY69D6V+KSzFJ+7nkMgTV1BRc5IvR2FViVd
	g/kJq/O+HsPqlgcXaTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbD-0000000GcLF-45Wd;
	Thu, 29 May 2025 22:19:43 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbB-0000000GcJf-2utm
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:42 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23228c09e14so18814775ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557180; x=1749161980; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WiZvL65gJWBhQxETywMJkkZAmvBLGCJuVJmqPemzNU=;
        b=XLg3nMRt20z3Ug5xs+FYL15Kz+tHwwpIH9CzAtWSLQglPDiVeka3ipOeDw9JhjsGCA
         3vYTW9kQjl58GdG64MOjVN4dxAyv0VQpXoqyHXV0Wt07GgZ5t9OzOfLFp3kP33tG9zFF
         FbAOUFpfyIghHh0JPdecW+2LVGwsf2ZqvqEGmDNs8gl2PpHbWUcweUq6A3Zq0GhuGgkr
         t0/HDTcrQYSyD/bMIJHiKn5QnLVo/9WvwwVyYDlxY26/HRLz3s51QPJA/OmPQVKdPNf5
         leT7lre0F5pyUZb/9bDHQVXEv86+EQMPRfBMq/altfAc9tKeDgGsxfMAk9zfqTBxHb3B
         RtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557180; x=1749161980;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WiZvL65gJWBhQxETywMJkkZAmvBLGCJuVJmqPemzNU=;
        b=EVLVs/TqH68dxLjlByjJbZzFrk/dUOl38uI7H6Sx4TaLh85gujlYMn7IhxLoW9FzaF
         X2dqUFd/UdV1wMZSxigCSy2V41cpPP5rVWZOD4uUAUxykJDXa2RIG6RO2OHOwMNsjGWN
         OxIGKEWXC0+6f6KyCXZhld2FxtEmX7ZE0rJXnZhvyQljjVdUIoNDjjpq9aMtiKndP+IQ
         EXu0bXftEfCrXkfzNDir+klIdjV9n94OeNGeejBnjZXM/Hv284ckriLlKvE8Tq41nGmA
         mxJV100oioTfLqa0czZgvkwBMdQstkikHml14xFh1z5gvjbZNZ53OXslj54pE+06L2o6
         NsCA==
X-Gm-Message-State: AOJu0YzfUOkHoHndCVKrfXyzs9I5QhSH3RB8s0bbr7G0If3W7XUJhRFm
	Jd5DLJ3LPDt9zvHil21DZ6cJucDQ6e333s289uFrjIrJxT0O2l4Uii8QdFlec7wayR9XbyCcBCB
	ywqYyXA==
X-Google-Smtp-Source: AGHT+IE/KnIFPcTR33Ni+A0ag2QlB6J3OqTksKtrH9lZLuske3p06HrhdBLvdwE6B6sOh/7FJilM1pbp4Qk=
X-Received: from plhc1.prod.google.com ([2002:a17:903:2341:b0:234:d7c5:a0e3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19cb:b0:234:f1ac:c036
 with SMTP id d9443c01a7336-23529a1357amr17181895ad.50.1748557180372; Thu, 29
 May 2025 15:19:40 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:13 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-1-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 00/16] x86: Add CPUID properties, clean up
 related code
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151941_733981_89C158A3 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Copy KVM selftests' X86_PROPERTY_* infrastructure (multi-bit CPUID
fields), and use the properties to clean up various warts.  The SEV code
is particular makes things much harder than they need to be (I went down
this rabbit hole purely because the stupid MSR_SEV_STATUS definition was
buried behind CONFIG_EFI=y, *sigh*).

The first patch is a common change to add static_assert() as a wrapper
to _Static_assert().  Forcing code to provide an error message just leads
to useless error messages.

Compile tested on arm64, riscv64, and s390x.

Sean Christopherson (16):
  lib: Add and use static_assert() convenience wrappers
  x86: Encode X86_FEATURE_* definitions using a structure
  x86: Add X86_PROPERTY_* framework to retrieve CPUID values
  x86: Use X86_PROPERTY_MAX_VIRT_ADDR in is_canonical()
  x86: Implement get_supported_xcr0() using
    X86_PROPERTY_SUPPORTED_XCR0_{LO,HI}
  x86: Add and use X86_PROPERTY_INTEL_PT_NR_RANGES
  x86/pmu: Rename pmu_gp_counter_is_available() to
    pmu_arch_event_is_available()
  x86/pmu: Rename gp_counter_mask_length to arch_event_mask_length
  x86/pmu: Mark all arch events as available on AMD
  x86/pmu: Use X86_PROPERTY_PMU_* macros to retrieve PMU information
  x86/sev: Use VC_VECTOR from processor.h
  x86/sev: Skip the AMD SEV test if SEV is unsupported/disabled
  x86/sev: Define and use X86_FEATURE_* flags for CPUID 0x8000001F
  x86/sev: Use X86_PROPERTY_SEV_C_BIT to get the AMD SEV C-bit location
  x86/sev: Use amd_sev_es_enabled() to detect if SEV-ES is enabled
  x86: Move SEV MSR definitions to msr.h

 lib/riscv/asm/isa.h      |   4 +-
 lib/s390x/asm/arch_def.h |   6 +-
 lib/s390x/fault.c        |   3 +-
 lib/util.h               |   3 +
 lib/x86/amd_sev.c        |  48 ++----
 lib/x86/amd_sev.h        |  29 ----
 lib/x86/msr.h            |   6 +
 lib/x86/pmu.c            |  22 ++-
 lib/x86/pmu.h            |   8 +-
 lib/x86/processor.h      | 312 ++++++++++++++++++++++++++++-----------
 x86/amd_sev.c            |  63 ++------
 x86/la57.c               |   2 +-
 x86/lam.c                |   4 +-
 x86/pmu.c                |   8 +-
 x86/xsave.c              |  11 +-
 15 files changed, 284 insertions(+), 245 deletions(-)


base-commit: 72d110d8286baf1b355301cc8c8bdb42be2663fb
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD59C5B552
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5L4ud1h/j60C3UYyjtCM9uyAe3Jr4YjYvNWuntahT9M=; b=xsrEdDJqBo96+N
	By8REar3lb3hkVbQyFl8cRWQrlj0tnBdu1bjZJTuQtDvy1EiGiOJQGR79UhlPPo2MdO89vQ0b7l/d
	9lDOQASDEe6U2y0oKulW4YV3qiiOo01zjp2Cbk/+PX8FVKGSIqM44JLFQutrQzhPrP1XcsqhlRLzZ
	DZLLgtDN89LQDpvHQUem2BzV0/zZXRbSiQ0CCdFRipSXvheZjSs7shawuI8suZnrqpwk0Vj/mLnud
	BRxMJAxy59t1RKXjrFI8UvHQIBdbPSVSasDb0C1J/9SdoTYYKzJ2KmhCsBFJbJ7asMFfi3FkGUQWS
	MjZosujVtaW66X0YNmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbL-0000000GcQO-2P0A;
	Thu, 29 May 2025 22:19:51 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbI-0000000GcO1-37QZ
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:49 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311eb7889c4so1179223a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557187; x=1749161987; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qpJ3lqvWpdWxqkl3QOJ7dzcCaTBGRsqwoUxsRp/BgHs=;
        b=Bwifm6KVZblV+0jPCl6c6dxvmAXUJ/33vVqvgVAnDnZ5kBa0w2R0JReRPgpt0dCC0i
         iIWWEwPeR+lEo+VSKfNcndcTwiDmPimusl7kBGL8Lwv7jN0b357c2oey2ygfmEIQWFTU
         Wu8gr+ZSc2t39hqIjHKiLN2MaNfkz/Ie64rlNYpiMm0PN+L9GcI17UgxJ+e3r4SbiCu8
         Jpbcq6t/vFx759G93rB4sozwVSaUMPXXI3pmmK+X7exlBF5GHMqbU40IKO0Qig/IDwV4
         kWNG446UoYa7IirBy6A1n+NcqSv0vftJIDIlPPfTK2vpFMpvUcne7R3n9ewOBWtVV1UN
         OppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557187; x=1749161987;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpJ3lqvWpdWxqkl3QOJ7dzcCaTBGRsqwoUxsRp/BgHs=;
        b=T8iTF7PJHNfIOLm9cU/JYQJGj1VOTT/AyE+w2YmWc5jq98LYGsoa28eXcymX+YVgSO
         xVc9pMFMMYWV/axVZ2Xl5UnPAYB2pH13Idd3bUytyI8Fie3g/mYNQDQgauMYAHowZwzr
         0Z5KyfqQKzdjQ6jJQ+ST8c5fFhfOvaHFw+Omiez47m7tpDJYN1Io/S3fzCiJ6v69kPbC
         2I6PkkmJYzaHeMjO0IncbBrqqy3uWIyIdy3Y8c2yDMA5CP0xh31p+d/RtwB0bIWhv0bO
         MTFUyO5wWwKauINpkv3AXePBNYK7ot1BAF2B4gFACMPpmFSFY5uRIyh0uqLSKNLtYufy
         NJ3g==
X-Gm-Message-State: AOJu0Yw+gDES5OyxXRt+JxiIa2kKxKcMpv7auFxG/ghN+fcDUc97T9G9
	qp1lkUJSuKODRO4pWwMKtQuoYY4ovPC7+B8MZTI6w2UrXNcKEgeqgzwWG0PF0zySL7erhyDOq3f
	d/M4fXA==
X-Google-Smtp-Source: AGHT+IFX7xA/wNBD+GkVjlH4FgWC9b0N7YtakX+E8PhKZ0lflUPRAVkfmvb9rXlMNwMUrMjpe+LFsX0XUn4=
X-Received: from pjj12.prod.google.com ([2002:a17:90b:554c:b0:311:f699:df0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fc6:b0:30e:3737:7c87
 with SMTP id 98e67ed59e1d1-31245dec83emr1180483a91.5.1748557187294; Thu, 29
 May 2025 15:19:47 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:17 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-5-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 04/16] x86: Use X86_PROPERTY_MAX_VIRT_ADDR in is_canonical()
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151948_781746_42FDC194 
X-CRM114-Status: UNSURE (   8.19  )
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

Use X86_PROPERTY_MAX_VIRT_ADDR in is_canonical() instead of open coding a
*very* rough equivalent.  Default to a maximum virtual address width of
48 bits instead of 64 bits to better match real x86 CPUs (and Intel and
AMD architectures).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/processor.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/x86/processor.h b/lib/x86/processor.h
index 6b61a38b..8c6f28a3 100644
--- a/lib/x86/processor.h
+++ b/lib/x86/processor.h
@@ -1022,9 +1022,14 @@ static inline void write_pkru(u32 pkru)
 
 static inline bool is_canonical(u64 addr)
 {
-	int va_width = (raw_cpuid(0x80000008, 0).a & 0xff00) >> 8;
-	int shift_amt = 64 - va_width;
+	int va_width, shift_amt;
 
+	if (this_cpu_has_p(X86_PROPERTY_MAX_VIRT_ADDR))
+		va_width = this_cpu_property(X86_PROPERTY_MAX_VIRT_ADDR);
+	else
+		va_width = 48;
+
+	shift_amt = 64 - va_width;
 	return (s64)(addr << shift_amt) >> shift_amt == addr;
 }
 
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

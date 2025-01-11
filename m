Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627EDE7719C
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pcg0wrqplfqBqsfVLlwrJih35907EDQq6T/bCupQT/0=; b=LgQGx8XDr/F13P
	1Hnh4hXlnW/cHcD5CyzEGUkzcTFN82c2b1A+oQtSgHwhWbINAGDqPWva9R4TroOXfafI0XP56O3z7
	UHMMuz6fXKYvQZqtKuHrSDWrORRfvTaaorkUUh0YV+6JoIHOM18VLP+STP9rqERZ1GF68hiEEjJv4
	VMrUYtmwtwvxz47Wx+solbe7K+pj+eJhnBzf/GQLu2yG/4OZLXsM9YpU6aGiDqyN3lv7GQcfn/JlP
	AkLrIToKgt3aMcIUwYNJMhFfvqtav1OnLQeqA1shLecbTvz0TDRicJbAxIbYPOJrA5Sm7OVwFzv12
	ynsmGbn1whENgPS7w5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPoO-0000000HRde-0S6C;
	Sat, 11 Jan 2025 00:57:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiT-0000000HQOb-3HK0
	for kvm-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=; b=O0zJnLSps821OGPYFQEV/XAeEZ
	NoYdWHyE8uBIaQ9Tl1Aoe+X0ffH7u/7u59LeG5otL/ukcoVyL5LnOup4Z/uM4pcVgPuIAFqPyGmSm
	z2/tw6S4PdhyTLRAfuXGgwKm5Xx73Vg/sz9n1Sl0S2h2b8U2TUlVahoqQWIu5+WOjIx1INY4HmuGi
	fWLpGJf+f48qxrpe80k0rkFCCauX8tVDSI08EJRZZw8AjKWAXYbObPGX74rYrJK3gmFPLPkuv7qK+
	VuKVv3EHoGnQUh1EfmCS7UlVh4dc27j9rbql0uJrYNkLoNOiFHqfFtIFQPB6YQjSHJzKl3OwhTFOu
	o1oO9vqw==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiO-00000009yMc-2r1i
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:04 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so4756951a91.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556657; x=1737161457; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=;
        b=1GWrbGjeToC2RYU4gx/iFiDZRRFfQW96ANC4m+0eucYdwOcHhmqlAZBE3yhR6rcD5L
         DAMUjqb9hwUFXqN2Wp1gSC5xZVKeRYq+4o5YiLFnIuzcYvFxk06S8OEiSeSpiYGCc+f0
         IQUil3r4RxZsdrVLo+ui0xanNhvgWdLL9sAUjLn03NuJgfxDA3IXKeBuhww0KHlQE/Aq
         bdl7mGnLb2xJocv8h4NzP8Wts96SIHwNgRp9WtkoCtUtjWnBzy9oIDNWEc9XY+Hu52k1
         RncJcQn0QG/jmiAT+Yc0R2SbOWZPnAQbcIHQRO8hXwi4cw3R4+i6xDpUWipKWw+CPgCN
         lIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556657; x=1737161457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmZxaHK89gYqxCqQ02UIn+br/dW4oBYWdpIBYGTzQvU=;
        b=YP9hHv4fSnrIQ9RswSZ3u7jkSe39DtuhD931b4u0sE0SURQW927Tt9PZfImE4J7yVZ
         hvaU1RzrL9sOK5/Dg0XCSf80ZFmmgPosYt1hbebZUadYt57xcB/hKTQbavWhOH6hwX2+
         zzrM/2TiBK9AiasrDh+zugjsbHVg49yeglR5NMqV5fBczGMSUrNwV3zqliJRsmmi+DeU
         AirhfBWeziePrll5Rze8UT6q2HmSoxOleJ2obaqTTGP2dZe/AEZECTVMQqD2weLM+/h2
         N9qlkm85yZn4Ia6NYfTyO6XRFM2MTWnkH9iSanYtuWeQ2d87gxksWvJEPO7IQ1GpKQ0d
         woyw==
X-Forwarded-Encrypted: i=1; AJvYcCUswPKcnODoXm7km45pUAbiTi5S1Dr4ME1wPLiafW9KfC0B1bpmO+AOmp2pA1GL+idm491tbP0Epoc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEGn7lU0tW1DyWI/rfpLE2R5ar9g0Q6KDIFP8Co+Vh5EM47y0c
	0jbTyxFXb3mI8STHOaIwy5CKFA05eG2kz1PT1QS/hHHF3pM0K49rSZIrGWPOnxwas9FwMKlkwJ/
	BHg==
X-Google-Smtp-Source: AGHT+IEiPYhZFrxECLTpeRyhrniySkHxs86k154WoHT+4SPRvFRx2z0MZkxZdNLfF3LCv7K79vdra9fQLrE=
X-Received: from pjz13.prod.google.com ([2002:a17:90b:56cd:b0:2ef:7af4:5e8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2cc5:b0:2ee:c91a:ad05
 with SMTP id 98e67ed59e1d1-2f548e984abmr17519047a91.3.1736556656714; Fri, 10
 Jan 2025 16:50:56 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:43 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-4-seanjc@google.com>
Subject: [PATCH v2 3/9] KVM: selftests: Assert that __vm_get_stat() actually
 finds a stat
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_005102_779482_BC0710C9 
X-CRM114-Status: GOOD (  10.13  )
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

Fail the test if it attempts to read a stat that doesn't exist, e.g. due
to a typo (hooray, strings), or because the test tried to get a stat for
the wrong scope.  As is, there's no indiciation of failure and @data is
left untouched, e.g. holds '0' or random stack data in most cases.

Fixes: 8448ec5993be ("KVM: selftests: Add NX huge pages test")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9138801ecb60..21b5a6261106 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2238,9 +2238,10 @@ void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 
 		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
 			       data, max_elements);
-
-		break;
+		return;
 	}
+
+	TEST_FAIL("Unabled to find stat '%s'", stat_name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

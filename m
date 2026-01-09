Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA3D232EC
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JhvQ6LwJamlkGybaugT7v7yGitMzJ/02vvxrPY4Khnk=; b=XT3/mUUuzliQlmP11J+SalT0J1
	Z1BTVSletaXjV/WiSdrB56nK/gjvRrdAcUWX7IdkuX9SaW96vPp66RBTRY5thFBkXYKoFFfzSc4hx
	NFUVYxGzPeizC/XHrJt5F8dx236I0+UKJRJqAxbmWIteJg3oOZeE09LOK1eGNHNqe03IVH5QEWZ04
	0+KixKylh60arqeNLoTqrdda+tZuwqjvn3sHY1iLhz2dWT9RmjRG7sHTPZYgw1jORJGjd3HRhfgY9
	XRRXx9P408+glhxUyrBQVh2O0o7cZZJ4z2o7td+2nXpN8404sZy1DUoP0WELnzQFfd9YXTmZeLTVw
	EGiaxQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lP-00000001sha-3XmR;
	Fri, 09 Jan 2026 08:22:31 +0000
Received: from mail-lf1-x14a.google.com ([2a00:1450:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lI-00000001sWS-2YBj
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:26 +0000
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-59b796a0e40so1232357e87.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Jan 2026 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946942; x=1768551742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqG3laPI6vEHEXOM9R+vgmhZHRmAA+/4qmyfh5dJ4MI=;
        b=Gmsv/1Ez4/jhF2ucD3AC6YjtdM4BMv8BAGUYAnZgqfXhCsiatEgi6PmNnpFBIfkovW
         S9UmYqERKCYQ/XKyZ2RRYQXXkhJiK45jRAnWwPAETt8r/w05gm6YcNXnfrzPxYh510zU
         s1jq2/hhGFG0t+HfMtCmpYgA6YNdrisUg9d50cR/RQQ3YLyI1JGpvnwcplROri5e3QgY
         P1It0FEIOQogNxqtD/xApBIXWN9/yCnVFkkLYNte9qOmxT2Je5AaB3X5T0mHsT9PMH4W
         jhiQJ2FEMNhD/eZfPTchQM4SrRQaUN+e1IfSuQLWXRiDf4Cs890OFPcIi2DT4fc0ZA5j
         CWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946942; x=1768551742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqG3laPI6vEHEXOM9R+vgmhZHRmAA+/4qmyfh5dJ4MI=;
        b=pZ8f/k0wg1ItCTizmXAmly5F5oyOg/mVmGAhV1ScHg4hfwllUGRaavFQb4DLrp0OJW
         a9Ug9fOMLoEgiZyez3zZFZ5YClU6kSDLTx6i29My8Nl6mkMNO+9UQEe3wHbKW9JAU9OZ
         9E61/fZ1GA71jRXL3ETx+S8Fb6OT41CdDDzHjhfl9sW3wJ/ZyY1ezVOp8/qeBhWSiT7B
         IMZbMhLhXoPFeg5ztjpVMvKbSAaRan5P5RzHTHjtjAKqJ3kPRgWomJHUR9y41vq1My71
         1EHvAIofVNBMmtNrMHONZq4aNeIiSLTL5CZ93OSFh1JQ06wGse/fKnQSobvz7Nfw2JwS
         hMLg==
X-Forwarded-Encrypted: i=1; AJvYcCX3yrRQ3BZ/eQTgXIlsbn7zb3LUmQWUExevdl2aeSEbEeEE3rtR/Sra3RFLzz4bBVA5liP8PF3G+pA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzl6U4P//urd3IvvPOgyUGLY0go0tLeItlV9RGNOLDfe1Bgcdi
	QPJNb8M7Z0SEBkDTVFfLr+/Q98696bHuvbBctBlSTWFOvrv1KMTCme5ANFPQW5huVYCrMS3J2lz
	zyw==
X-Google-Smtp-Source: AGHT+IEPiBQu8APfXNA3IWNbMpdOagfDDvRFnwb8uKkQFHMSY7VPVHw12O3QIkHoI1cD4SsInszAzyQFrA==
X-Received: from ljdv18.prod.google.com ([2002:a05:651c:4212:b0:37f:dca2:6c99])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:3c8d:b0:595:81ce:ff83
 with SMTP id 2adb3069b0e04-59b6f03a0b4mr2586927e87.25.1767946941603; Fri, 09
 Jan 2026 00:22:21 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:15 +0000
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
Mime-Version: 1.0
References: <20260109082218.3236580-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-3-tabba@google.com>
Subject: [PATCH v4 2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002224_723594_254AB2D7 
X-CRM114-Status: GOOD (  10.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

The implementation of `page_align()` in `processor.c` calculates
alignment incorrectly for values that are already aligned. Specifically,
`(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
boundary even if `v` is already page-aligned, potentially wasting a page
of memory.

Fix the calculation to use standard alignment logic: `(v + vm->page_size
- 1) & ~(vm->page_size - 1)`.

Fixes: 7a6629ef746d ("kvm: selftests: add virt mem support for aarch64")
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/arm64/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 5b379da8cb90..607a4e462984 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -23,7 +23,7 @@ static vm_vaddr_t exception_handlers;
 
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
-	return (v + vm->page_size) & ~(vm->page_size - 1);
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
 }
 
 static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
-- 
2.52.0.457.g6b5491de43-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

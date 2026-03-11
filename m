Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE49F103E2F2
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F/LnSMvfXzveT4XadEloXVdG7rqu5UxX/Ll5QRXEr44=; b=2MxGeC/C8K/iC/
	rmH6OP4r3USNQDECUrBOhBIvLMzMqSVHeb1JbrQoWVJ76+MAgjO2tLQjUTGhBCi/cPSUa74xLC6F9
	QEcxUy0KUHFZ+9RmPdCeN5JYo7fCeaelX6kCU+4AlMeXil2htRdn+Ck7PqMYyAEpjPr9JJRXvmEqX
	C/zoi+aib3owAl9u04uWDrGBIUsVn5DpGq7qp6wzLFFQXjm0ErkQLpnWaumZTTLhnHh4h8mhxvn7X
	hudp1OHOyCwsrnUd/nh5Py4zN4VylZHKC+x0BxuUDvHLme8LNLsbk8vQ3PkX2oAweUNHBRyN7mwgK
	A2WwZMUTOL1fkhz/MuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SpA-0000000CnXS-2Ml6;
	Wed, 11 Mar 2026 23:18:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Sp8-0000000CnW3-01II
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 23:18:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so2753225e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271120; x=1773875920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q/PJeovjjoGLMcedyN4Hvdo++XuOQtv9Fm+hj7Ucl68=;
        b=YlhvLr0aMdTRb8/DStX05Sa0kF3Gd9L+mAbIrquZD7aqMr05CDq+ZMy1qM2Rva7dgi
         aTde5JbGhyMKojzdj7/2cmHIOCaS5Itn/sf9/IDo791C0TbhZ11IixtNkFP0CFW7gKsb
         qxneW6CWdgaTgHMvUn64o5DwdSqpLAJHAcB9jkzEjwAMoLYdiqrw8hpUD/nTzjX2icCG
         Hcs7K+yIR1CQBG0z7kK9gQLFUJGYvzRd4O1uM00FnIFLQS6QzhWwun8CSpW5Po5w5o8F
         wXIRZ9AUrjlv1XDcvLN71tFDjXkq2shl831Bf354iocd3DOQFZyOcq+v1ECNXzaUyrIq
         VTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271120; x=1773875920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/PJeovjjoGLMcedyN4Hvdo++XuOQtv9Fm+hj7Ucl68=;
        b=NJJtSrd4ZZf3HCafsgZgyO02Hbc7W6yZyxm+arWv9MSK4++Keze7OsiDrxARrkBkiE
         k3yJEKpTWFeDPEqYgC/gmnVLcp5if64bFszy/4uTBuZ7jqOsywCGVWSfYO1sGj+JQoAg
         8Knfq+0nCAXe3rBGkPriZcd0pJBOOlA0tK3PgwHxDbl+kPRVdGHrcTsNwh8GJYsMDf7t
         zsnH5Onzd4D+EHOPVYLVzeX81RNSpfx1YlKYBqrfhPr+BEHDoTMKKNCdF8cgRMrlwQSm
         sZmgKNc1FaO9KYKrQV1Oxp6DGKGJ9MPHHURObKFISJZLav+JM0rgpmxfmCU0Y2PEE/ex
         kEyg==
X-Forwarded-Encrypted: i=1; AJvYcCU3xGZaFVWkOVZkH5QbETqvZzeRZEk/05G2UNUTD8gUa3l2AAqP7IDSJHwF9rc3/MnKsWIA8ldPyu0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6mlATXLRzieAI/XqzNorRLNIV3DD9QTbmW+KV6ePPjeKoCafy
	bOka7jYhM3zElWdkny+lYJloQSHTKh4kBjwXeuxrXroELKQ2FrBIDJIT
X-Gm-Gg: ATEYQzwHhRvSipg+4Z8ZR2g8gvePpQulvOx55Zi3X1MeSrrKRTNk4pbcy9F7MftrnP5
	pFegHYmlHdrHXdKNVmdEUrtIUfCmY6mCWaAuEk7xXm+3HJavfnLBTMWueLN8AxhZYCAn3eiJFGs
	YGd46bQrrAfK1y8Mu2e2zEj73kr1CP1+RNHAIDSk6Tqqfe2fUfQ3nsLWHtRvB24+n8/E4kYFSMf
	IuQbnurtQkzK6pAhE6CvWXqoo7dP/TM/AZ2TwgYUselesv/zjeB3+3qmNm38nETRr0oqqpsprpK
	ZSiB9i9G04E0huzl2fMA7CX8nxPF6obxjzeCnqxIniKKiDpkvtVlx79YE9UKuxoKsqj+B/+r37D
	B9tMfM0aUYoHJAbmA3jNMN3Z1WiKGe7LmOFN45wdBhpqolHqvvdgQRRD6SvPkTyqjYS9ZW05kpd
	x7vZRnKqLXX/kqsDonD3a7VV+TiYzwaDBNqMUSYk5tAfz9eXFShvF53RmsGxQx
X-Received: by 2002:a05:600c:1e8f:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-4854b0a6c39mr71236095e9.5.1773271119975;
        Wed, 11 Mar 2026 16:18:39 -0700 (PDT)
Received: from osama.. ([156.223.222.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6bb4sm83586675e9.4.2026.03.11.16.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:18:39 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: [PATCH v2] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Date: Thu, 12 Mar 2026 00:18:32 +0100
Message-ID: <20260311231833.13189-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_161842_071305_02C259BD 
X-CRM114-Status: UNSURE (   9.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

When saddr_high != 0 on RV32, the goto out was unconditional, causing
valid 64-bit addresses to be rejected. Only goto out when the address
is invalid (64-bit host with saddr_high != 0).

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
v2:
- balance braces properly
---
 arch/riscv/kvm/vcpu_pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 4d8d5e9aa53d..ec0c15726da9 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -423,11 +423,12 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	saddr = saddr_low;
 
 	if (saddr_high != 0) {
-		if (IS_ENABLED(CONFIG_32BIT))
+		if (IS_ENABLED(CONFIG_32BIT)) {
 			saddr |= ((gpa_t)saddr_high << 32);
-		else
+		} else {
 			sbiret = SBI_ERR_INVALID_ADDRESS;
-		goto out;
+			goto out;
+		}
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

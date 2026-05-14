Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72647CD4F25
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 May 2026 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rs5Uw/p6bG31BwvemM459aXJYiIrcHwNtjWAiYH9dCM=; b=oFHsARw1vjDWC9
	WiPdXD2wV82E0ahDJ1qn14zzODy6K+gMClK/0wvdFCO4g4cNi3QeF0ok/OmgnVf/WdqcnerV5scSN
	9hioe4ydK3//7Kk9nuWxtx5aMdEDQ4J+oY4kAsoT2W66NP/4ac0D9jJLwp1sBWFdnjn1vDf3z0Zdv
	0nAx2zjVpyFNBEDp/90wU/Xa6xv3toiMhYv4P49wvcMoOcMzvq2hFv9dz+l0AqK+spch2/ow277Nd
	T9tQWPfWR7cRHiMraK3tNplvagQpu+EljAEWPIQboasEfXwCZxUgTP5zTIspaVAbZ034ETYEN4c8n
	EQ0pHw9BnL1pInoeczLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzU-00000006DS9-3h3z;
	Thu, 14 May 2026 17:36:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZzT-00000006DR8-0AAp
	for kvm-riscv@lists.infradead.org;
	Thu, 14 May 2026 17:36:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4526a8170ceso4660874f8f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780213; x=1779385013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KChkhZSF5dUBGW1dpwhtz2Nd2WW6tFTUrsIGPgeyre0=;
        b=Vv39yy9j9Zu2M6gYu4fMfy0nUFsq9nvg9XSHYv1O6+heQq4p26IISrC0Js6Wan3Bad
         RnvgPCWcoZfTQ6Vc9eupoi5eH10rU1MSCwr676mQKa5R0HiACPo4v/ugPQJf6O6WM6ak
         ZQ1x2WfaLuPJlf20cvWbUin5GVEZz9k3qHqbDX2bu7YLOSWW6nLjjjnWLbNOENoQI9F1
         ocn51NBtJyYBtbT6psyhXC4HJJt7AzlB7pBRDXPmbkKzdi9yObJ7M4vsxOHBVMxrJfnj
         Pa774zQUWIiKKLGD0snMFE7GUmF7qI4Cb/kROCiC7zLs80pOK1WM6Dynf3XywqAP/S7H
         Jdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780213; x=1779385013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KChkhZSF5dUBGW1dpwhtz2Nd2WW6tFTUrsIGPgeyre0=;
        b=TGQksXiKnqAsIJ7aza/AvsP6eiWbQ8IB5k6AbKZo1cMrqqCnqvcASRDPbqFj5w9KzY
         FuxHgQDFiWWREVZHRGV0mGdzUTmR8X8vnI+A0NpvSnQ/MaAzi/GUwKR4coCLrF5VuERV
         PfGZuownNi27+UxW4D92fy9+2zHCeMyk6lxHSZ3QZ3FkiSIGwoLNgVBEVpKsszvAByir
         krQYFRRtjQw7L6xt859JN+O68RHJHKztEKrTRmW/65BEH4GUtXvZfh/HXXRYTmMXTMcf
         QLNTFTeP6O6/ahCQoccArkSP8JmP8oYUaVHacN/dBbvr7pmc1WvigGJyymFup1BxOilT
         priw==
X-Forwarded-Encrypted: i=1; AFNElJ8r2o4aZtJhAtkJNkxJ8KQlzwcx7TfgpN7C3MAzOwJFKVV92OZ4fhIkqk+6T/3cXRCVgQeL8cqTOME=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPboo0JJ0qvdkCD7VgCqa/q6To4vQa2gDg2DLalmzNTiYzPWQ0
	2ilzhCK5WmWEAu/notDHWAJOofCD6TEW9XT7K5AfwH+dcOuEYSXs85crNX9Emw==
X-Gm-Gg: Acq92OEREX4sfrWY4u32KGCjCtkzWZwYUgNs7056n5K597RNp1UcvbaIXsJD9o/iXUv
	EKmWKESJqafNZdxy9t1ch+oeV6PofbvX07QmkN6Acq5UB7QJCoVJSfXCSmXdauzr3PdBQEAY0ad
	O2Wj/ON8+66bkr+x7Duuaxj8jej2xJ1t0BCRgqZ1NZSfMiXyUwrfuhfGITW/dRQMu4OwCthHfmm
	k9s9/Q7ZmYlpGK8RhgJyILm4t4Hpel1TvgMU7IlH0sNQYt3YGKDx2B75aLz5HjWN+qAiKhjgchD
	qctAFPje2hVMuw/LYodkJpvxE6NFeeqJ0EuNc4RKgNHuFIG9Wh6xEk5D4jXyBELRTA5po+XrRlI
	OwkqZrmDLqVqL/C9uJdEoH4XK5p3mo1BAAbM8vbCCc9hYpFuBDnTJIKzYjBfoo3Z0Sug/s69YDi
	sOA1y3j7TUp0c6XpnpC27v+LEsbA4n/MTS6XE9WPXF6OGe/aD9qYIXM4vwFGGZ
X-Received: by 2002:a05:6000:220c:b0:45b:d891:4ef1 with SMTP id ffacd0b85a97d-45e5c60497emr19791f8f.34.1778780212640;
        Thu, 14 May 2026 10:36:52 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:4f8c:d716:5699:930b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe222bsm6575063f8f.27.2026.05.14.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:36:52 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH 1/2] riscv: kvm: return SBI_ERR_FAILURE for pmu_snapshot_set_shmem OOM
Date: Thu, 14 May 2026 19:36:40 +0200
Message-ID: <20260514173642.41448-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_103655_075313_7A990221 
X-CRM114-Status: UNSURE (   9.62  )
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

kvm_riscv_vcpu_pmu_snapshot_set_shmem() returned -ENOMEM from the
SBI extension handler, which caused kvm_riscv_vcpu_sbi_ecall() to
abort KVM_RUN and surface the error to userspace instead of
ompleting the ECALL with a negative SBI error in a0.
Use SBI_ERR_FAILURE and the normal retdata path, matching other PMU
handlers and kvm_sbi_ext_pmu_handler comment.

Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index a935ed96bc17..91aa0155a420 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -453,8 +453,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	}
 
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
-	if (!kvpmu->sdata)
-		return -ENOMEM;
+	if (!kvpmu->sdata) {
+		sbiret = SBI_ERR_FAILURE;
+		goto out;
+	}
 
 	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

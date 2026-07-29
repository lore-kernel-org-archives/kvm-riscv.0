Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7705C53200
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWD8Y4qBfDqx/G2XEO4D3cdca4zoA82Y53ExgufRSQw=; b=rza88nlndwDCCd
	HnOaBTogcP7CHx1Ukk7GTNOy8phpyyiLiTOWXVzGqz2v76d5vwNu5h4aLWey/CN18SEtA8Zl01vfr
	/OS42nbCe4WYl3sqYL4TscydC5nEwMGd/VH19MB2bmC/xjEIhr7dBHintgrZR9yQ3PKzo8hhgZMw4
	lIPUro0BY8DHCx5pLfeqf6A/2At+Tv5iUpTLh2sPJTvyxcVFlFJlKL/Si3sYaO3LDxhlilxg2GEwF
	Lva3XtIolstAa5FqkbUaiGeQ6B2Hv7W6qDr8gqnKO0+UaHFN1ZmldmRJWqEoGuQsgpuq93RDJmyDu
	WGOMowUo+UWBdZapN5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34b-00000007pPM-1xuK;
	Wed, 29 Jul 2026 12:07:45 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34Z-00000007pNw-1oma
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:07:44 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca696c4b152so264675a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326863; x=1785931663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyJMaQ1sYDuVfSZMuwHiwzVH9paIzHnqdE6/bJyXJ+M=;
        b=hOi7zRu7jbXaHEUe4MzzljG7Qb4Wwndc2RdGfY2QqMy7q8pFKLkO/m51P7mIvnefso
         T1ioqRxoYc/0S4ICZ9JjuSYTfK89U0zPEuq21KPn6M0rlDHdx6cfs/OupL4X/jlFb50s
         zCjYlSkgfuRdUI+Y17rDWnV3uDTMYzTzvoxQaHGpK35S9tP5I8jcxpCfHF33Aec/vC6m
         W7JvWQ56P6HT5JEVFLtku3eaibtNrVESTmAoDbuP+pQ9jQzdLdMwac45uNH6woKhp8B6
         NuDP4NULGpoEbPRkn1msgAGPMmwfy7B4AdXqMVzIngk7UaKoHjL8fx9pq7N/PRLpR78v
         /WDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326863; x=1785931663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KyJMaQ1sYDuVfSZMuwHiwzVH9paIzHnqdE6/bJyXJ+M=;
        b=kvX05NQ0QyIO0UGatuN78FsLAg6v9EAHCzz+TbsRm8hdelvC6P2R5kO0FfpzsmcvBM
         ZSZVIZt455O48NNNu+NNwk/IhwDpbAilF6RBGNSh7mobIb8N3uBHt/jXVru/mJTrKnl+
         4+sWRz1CfLD5B6KYql1tvGcpEaNc8AFOzL9u+D4DxBE3hcETsVgXez9C7smCdINo5gS7
         aGTFLWgLNlqRPhVsde2UBhcd3xjkhDs1zWWx6aufV0fSm/ZOfJZKQ2GE7tbgjtpYJTlt
         TjmUwAOBNZstOLgdv3YSVka9coRkzuKK7KRdQ/zk255I0xVvAZqTlwytwaRx+LIaAPpH
         mIoA==
X-Forwarded-Encrypted: i=1; AHgh+RpZkrhQs5TMZ1PoNLD5GM1P0PZSHRN+1IpYMo2/x6aaewvWSLOWU7SCcoZDZSS42EBrhZjG2MbtOdY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzP8CR1cT6k+kg84ccMCLVRO05yaMztI53386SEHl46+nDHktY4
	4GPXJO5cTdWh7ovp6bxcj9kHVYBYvDrtqu5cPPUw5a1is6/wtUzJkF6I
X-Gm-Gg: AR+sD12HdNI9I9QVIHu4wZj/MbZcq4PbVkbCJuhEXy5sNTwW3x5ALHlMcWNIDbgGw9Q
	C9JiQQbNghSLc0w0q/KFjHGtvQkeIvsXutLZBBRpUhBciia+tm5SYGNPQ0BGDPuz6EoQxiqwa9D
	uQRKNobljIZJgom79CgKdjgRLHg3/JBnWZ/RjDrHdfTx8pZ9GRvzG/u4HJFz7V9oHQi7XNHMEH0
	t9sHQHI2zKbpR6UnuH9BKzykzCwNMC8+DtLxGXXPYN4BiASa/s/S0MMBSsIOGIEB13CRSVlP7wf
	I6Pw9a+FN99HX3zqkh1rbSYvLyfYZXqrY8lxjTTn6cE2gulEhOOHfIWoypnygf6zLmWPjq0ZOEx
	WukxdmY71mo7K8rZ48UsyfwwZyEH9gIc/BoadIx/uzRV4a+aEZaoiEjGBqQcxJ39YLBKhj7qrUZ
	yS2VgtD4sI+IhlEATyo8Y+DoMeZMB1A5eVCDNfj3hLSt7/zfrIG2PddHoR9uxL/IlqBWbWxAjg4
	MSVYxQ22UcYJw==
X-Received: by 2002:a05:6a00:b4e:b0:84c:1cd2:142b with SMTP id d2e1a72fcca58-84e932ca245mr6604434b3a.9.1785326862618;
        Wed, 29 Jul 2026 05:07:42 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1309570b3a.18.2026.07.29.05.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:42 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	stable@vger.kernel.org,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH v3 1/3] RISC-V: KVM: Treat -EEXIST from G-stage map as success
Date: Wed, 29 Jul 2026 20:07:31 +0800
Message-ID: <20260729120733.829457-2-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729120733.829457-1-shanbeeyoo@gmail.com>
References: <20260729075230.743030-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_050743_480506_E7EA1BE3 
X-CRM114-Status: GOOD (  13.16  )
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

When a concurrent vCPU installs the same G-stage mapping while we are
waiting for mmu_lock, kvm_riscv_gstage_map_page() returns -EEXIST.
This is not an error -- the page is correctly mapped and the faulting
vCPU can simply retry the guest instruction -- but KVM was treating it
as one: printing "Failed to map in G-stage" to dmesg and propagating
-EEXIST all the way to userspace.

Align RISC-V with x86 and arm64, which already swallow -EEXIST in
their respective fault handlers.  This also lets kvm_release_faultin_page()
drop its "ret && ret != -EEXIST" special case: with ret normalized to 0
the regular release path is correct.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Cc: stable@vger.kernel.org
Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 8a0aa5e0e216..943d8dc72105 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -652,11 +652,13 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 						vma_pagesize, true, true, out_map);
 	}
 
-	if (ret)
+	if (ret == -EEXIST)
+		ret = 0;
+	else if (ret)
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
+	kvm_release_faultin_page(kvm, page, ret, writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

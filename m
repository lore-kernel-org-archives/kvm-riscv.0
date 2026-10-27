Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A3606A31F
	for <kvm-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gn7ZTHSh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HNUlO67k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UZc7fNzRtESve/58XUjjuhENtuScQdU6WZmYCALXQS4=; b=Gn7ZTHShmqtbMpgLxEQZdt1mur
	/+B/KisBr0cfeTSjTgOMVyaZuHEeVJnPBFv+uLYF8lSPzhqOqu60dD9GGytjLBFi9l/Vdt7JRzIV6
	1zKOzBQpEjYt39GQPIjYU+vJprI/wJg12KZsRvQ1lcIOyrn3fMcbktkQ12H5fTjcSqaMyLDQhqsLM
	9exCnw8VxU3qEfMDnZm3arojJjnqkbVlc5ie7tw+DMaE6JYEHQGsZ7weuvFkaRaXYUuU+bxbuKwgo
	MUXgKXZfaUeud8LLxL66N95YqXTg4WpILUz5xXTLJu2HbQDr7HXl357Nmlud7FN5rxmtwscsBzvU6
	71TOMS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLadV-00000003pnO-0FeW;
	Tue, 27 Oct 2026 06:26:17 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLadS-00000003pmV-2agl
	for kvm-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 06:26:15 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ea7190aea1so17248265ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 26 Oct 2026 23:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793082370; x=1793687170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FNh04yRIP0CE19slce4i4RIxfhIIH5488gtyMIknFlY=;
        b=HNUlO67kPti+bhF14Py0kau/++fRMLy/rh4u1wNeOWkZHUE3eRO6gMk8tR5Su9B3tW
         tSeDFUqtgHG+S45HH5Ss70ONXgkNqExh3T/fSYuxqSjzZeG1ucyaaT7id0jZ8Nh0kH56
         kWxnlJZwferQb9cyCcGqQrYzu8UKISUHocicvUQzmv3iTtV76jcVy49w5h+m58UUtkQT
         RqjXqKjqnCNk3hgZq5AFbV4J7DFkrvCnsrjFOAbe/jUAC538E3WviEV7PuapInoMyXYL
         FjxG1AdViB1/NFkbXkKttNORTWNvm4aTwpQpl847eEpRWXVWcs7YNQzX+aqESAaZhhkW
         4g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082370; x=1793687170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNh04yRIP0CE19slce4i4RIxfhIIH5488gtyMIknFlY=;
        b=B+M0+6xHPKqGcc6B6967yWM/ka09BVePnFZ+74LSBDrudFkqHrbKyqud9ygsSSWPmt
         09IvYmBgA0Ra2qIXJyX5ZyWeAihARnNXsgf/p2nLte1iq/TNl2QkxxL3eNhFt7/qKXKI
         x0vDVh6uS9aVAsGim9d6FLq5fppKtpJP1mR5u5UkJOXMhr07B3mG1zI1KTNw+S/Rwhz5
         BHbr2IM7pJNi5NOwj4oqeXTAYAzv3nX+PDkrNZPx0WgpEU5+cdBghT3LlcEg3Cd9oxkk
         Np0OfTfKwnkdbuzji6EswZ38ogvIppljb5ZISMZlMqXNtPFO/abjvHU7CO71qbD3p7vS
         hJnw==
X-Forwarded-Encrypted: i=1; AKwUvByyF/bbcz9aEnZKmQj4glH9l+1B9x8RWJ7XCBoOo11slj08TpfCFsLXLks3QaXzCxo26rBjzAj39B8=@lists.infradead.org
X-Gm-Message-State: AFq9FYLNbQXqucIUhCzf6IilUGFfKnopNxevRv8MMtCO6Le/VSKeivAi
	6cvYzLiLQS3b0yRIyYuc76zlgwbX6OA5L5nqDFggAxCiphVAC+bI04oWZKzhhT9EYoc=
X-Gm-Gg: AYBFou17wXMS77JKQoJTsx5gDfCkml9YnjBmKWc/VJTQ1M5wcawvdC9rRB+aNCnWYrW
	N46LthxecthRTSElucgAtv4TBsXJE/wfauwF6d2Hw+OPDucvhkqN1957siGBXlAbWJDo53Qusko
	ckn+phLqiJnIPH8fZJ5H0jroIPBdIzn7FFnNqJQirh9zsh+Sl1KL8o1lUsrCevgDOMkDd/yKogE
	W4EUoi0ir1xi4KBGNIeUChy55lbDIFPUM+N5TQPcOMse5RfwGnDqqT4fi/y13xC1APkpSLHwFPg
	OTcKjjTMxSgUJpTyPTho+gls+cSm4jsG2ymy2Iy9Mlaj1wBhKtE6OqE8thJ3GPaDnduxUVCoXxm
	i8QiUhbPPbcuUxmEzXuxu4gKXOurwRhcp3rnEo0iOzVz9c0jc4eSf4jC9fZyMqiL768956pMFMu
	Ol66VCErZ0ISj1Zj9q0z8AzDHNabvw2+wchYSqpJxi+xI6F0ongsSz3F/+XbOTOnQhtYHKw/7m2
	Q5rBEGYhCFnQscaH/p+3SkMNUVoRhSbHfz/5CswJ7/OqLnXUbXNGlkWulpjZfLe9bGweauA0x0u
	mc6HwjeQEvOd/ziUVwa1dNnqxlaYYBoWdThv9PiccRPjyq9hXg==
X-Received: by 2002:a17:903:26cc:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2ea9c913694mr67964825ad.57.1793082370138;
        Mon, 26 Oct 2026 23:26:10 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b79ce2sm4079055ad.21.2026.10.26.23.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:26:09 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Validate PMU counter info using available counters
Date: Tue, 27 Oct 2026 14:26:02 +0800
Message-Id: <20261027062602.323691-1-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_232614_652792_AC51F2A5 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

COUNTER_GET_INFO validates the counter index using the pmc[] storage
capacity rather than the number of counters advertised by NUM_COUNTERS.
When fewer counters are available, a guest can query an index outside
the advertised range and receive success.

Validate the index using kvm_pmu_num_counters(), matching the counter
initialization and read paths.

Fixes: 8f0153ecd3bf ("RISC-V: KVM: Add skeleton support for perf")
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e095d1ff439f..ea788619091a 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -560,7 +560,7 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 
-	if (cidx >= RISCV_KVM_MAX_COUNTERS || cidx == 1) {
+	if (cidx >= kvm_pmu_num_counters(kvpmu) || cidx == 1) {
 		retdata->err_val = SBI_ERR_INVALID_PARAM;
 		return 0;
 	}
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv

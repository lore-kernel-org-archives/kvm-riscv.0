Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B70CD4851
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3lODhtuIX9XUdKJghQTiKaP1TQTkR4jUw6W5C19uyU=; b=hDvO8CCYA3+B53
	pg0HKayp1/k0HHEBXalq/5LHoh/39EIe3wuz6jds2FOzpOnaTrZFVyKzaa9GiJWVMWgDEWFlP5J6q
	vRjgHSz+SyE0wFHEsbXn6an9bfV909lqk0DtrztgZiAxSFWZNZsiZlOqsiHu/BqcKIyfI4KPga4Gr
	7w0HMLSN65YaMRa3lbLIr52jg07w99PFVXh621qv/+hBEpJPioYtpRFxzfLRF4Yi2ADMZS0/WScUY
	AXeaFKNDX49rEA4tTIHcsddE9H5rgGV+et/dW+gDye08K+GsX111YwEHY1gjW7o49bGX6LK6NHSjl
	rOpQRNXtP6UTRbq2Z5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoRs-0000000H6NI-09b4;
	Tue, 12 May 2026 14:51:04 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoRo-0000000H6LQ-3ve0;
	Tue, 12 May 2026 14:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778597456; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=oA/BXvxtFGaJxDC1eZNxER6QIuAZ16AAMSjiGsJs4uo=;
	b=KGVgDAYI1UpttXYnhoEA/CHaqFWSkntWXOYScAOrwq1VlRKP7Iz2BbDCLl2zNb4orx1LDkedCeDL6sswjjLP/TH/K0/eQx+AHS8mo0+HPwNdEemg2yQ6Ts/MYVwadsUw20Kr7cVsGBzMUpaiu3bFFEIKVg/wjsBA4LoDqDHsTzA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=25;SR=0;TI=SMTPD_---0X2qnRBI_1778597447;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2qnRBI_1778597447 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 22:50:49 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [PATCH v4 0/2] iommu/riscv: Support Svpbmt memory types in generic_pt  
Date: Tue, 12 May 2026 22:50:43 +0800
Message-Id: <20260512145043.92214-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <3jtnhvij7vv2wjep42sijdwy6ax4fr4q6w4fwpyh2cpgzvbpel@w42zuvjl5cy7>
References: <3jtnhvij7vv2wjep42sijdwy6ax4fr4q6w4fwpyh2cpgzvbpel@w42zuvjl5cy7>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_075101_333842_025750EB 
X-CRM114-Status: UNSURE (   5.66  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Pj4gQ2hhbmdlcyBpbiB2NDoKPj4gICAgIC0gRml4IGJ1aWxkIHdhcm5pbmcgb24gMzItYml0IGNv
bmZpZ3VyYXRpb25zIGJ5IHVzaW5nIEJJVF9VTEwoKSBmb3IgUklTQ1ZQVF9OQyBhbmQgUklTQ1ZQ
VF9JTy4KPj4gICAgIC0gTGluayB0byB2MzoKPj4gICAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNjA0MTcxNDA3NDYuOTc4MTctMS1mYW5neXUueXVAbGludXguYWxp
YmFiYS5jb20vCj4KPlBsZWFzZSBzZW5kIHRoaXMgYXMgYSBkaWZmIHRvIHRoZSBwYXRjaGVzIHdo
aWNoIGFyZSBhbHJlYWR5IGluIHRoZSBJT01NVSB0cmVlLgo+CgpIaSBKb2VyZywKClRoYW5rcywg
SeKAmWxsIHJlc2VuZCB0aGUgZml4dXAgZGlmZiBbMV0gYmFzZWQgb24gdGhlIGN1cnJlbnQgSU9N
TVUgdHJlZSBgcmlzY3ZgIGJyYW5jaC4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi8yMDI2MDUxMjE0NDMzMC45MTExMy0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNv
bS8KClRoYW5rcywKRmFuZ3l1Cgo+LUpvZXJnCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

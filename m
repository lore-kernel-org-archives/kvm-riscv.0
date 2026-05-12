Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53202CD4855
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMU5tIPnX23R/3hRicRf8lS2uYZvIhYAdjjDJ22BWVw=; b=4/TsZRgu4qI1th
	GPJZTXkRjVpIY95abjnY6cVHU2SyEJHJ1e6oB9DdxW3PieNfE9fO4HtliauMiNYMpA+GCrHvmTOIX
	eNlljSrWNJ58diX31j1PAv31wTsAQeryDLhcLRSg9ezBvZKnDphBsx5DOBdpTdS3lHxyGwvpLncI4
	hHROmWeuq+gZTb4RRDcgVINkssfs9UULlBprCRdBbBa9BeYmQaPuLmTI61U1ReG8pKhQI/Le0IRwf
	fBPZmtw7nFjLnS+xnxBD0D/BYy/dQOsNkpA3rMg99xwSx/bQ+nt2b1Jei7wnuEX6aTrJqH2CTJFxt
	4WqnzHta9buYHb/bdb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhwJ-0000000Fzx5-2xrS;
	Tue, 12 May 2026 07:54:03 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhwH-0000000Fzw4-2MYN;
	Tue, 12 May 2026 07:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778572435; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=IKv62Crr+//VydOqD1xiLuBvfxqPwPa7ePrB63fI5fQ=;
	b=tX/QGAZhBY7+fHwvQE4z6LqBvk027DisgtTozqqOxdsCgQjyECv+7K7F6F32J4h+AOZpeEqoNP7DslWuMlYfjn8U132QyFCvWQVDZx5c964qhiwXu2mQmPaqVcYZIam2LqC7L0sYCEQtyFyaF6tuHZuf1UDopVx4t0cyFUeoNVM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X2prY0B_1778572430;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2prY0B_1778572430 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 15:53:52 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: Re: [PATCH v3 0/2] iommu/riscv: Support Svpbmt memory types in generic_pt  
Date: Tue, 12 May 2026 15:53:39 +0800
Message-Id: <20260512075339.18339-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <k6k2ufkol6trxucf32qxj5i2v7safcyososquomqr7vavqwvr7@s4b6h26htu4x>
References: <k6k2ufkol6trxucf32qxj5i2v7safcyososquomqr7vavqwvr7@s4b6h26htu4x>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_005401_962781_E1F4E136 
X-CRM114-Status: UNSURE (   7.66  )
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

Pj4gRmFuZ3l1IFl1ICgyKToKPj4gICBpb21tdS9yaXNjdjogQWR2ZXJ0aXNlIFN2cGJtdCBzdXBw
b3J0IHRvIGdlbmVyaWMgcGFnZSB0YWJsZQo+PiAgIGlvbW11cHQ6IEVuY29kZSBJT01NVV9NTUlP
L0lPTU1VX0NBQ0hFIHZpYSBSSVNDLVYgU3ZwYm10IGJpdHMKPj4KPj4gIGRyaXZlcnMvaW9tbXUv
Z2VuZXJpY19wdC9mbXQvcmlzY3YuaCB8IDExICsrKysrKysrKystCj4+ICBkcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LmMgICAgICAgICAgfCAgMiArKwo+PiAgaW5jbHVkZS9saW51eC9nZW5lcmlj
X3B0L2NvbW1vbi5oICAgIHwgIDQgKysrKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPkFwcGxpZWQgdGhpcyBvbmUgaW5zdGVhZCBvZiB2Mi4K
ClRoYW5rcyBmb3IgdGhlIHJldmlldyBhbmQgZm9yIGFwcGx5aW5nIHRoaXMgdmVyc2lvbi4gSeKA
mXZlIHNlbnQgYSB2NAp1cGRhdGUgdG8gZml4IHRoZSAzMi1iaXQgYnVpbGQgd2FybmluZywgc28g
cGxlYXNlIHVzZSB0aGUgdjQgc2VyaWVzCmdvaW5nIGZvcndhcmQuCgp2NDogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjA1MTIwNzQxNDIuMTYzNTYtMS1mYW5neXUueXVA
bGludXguYWxpYmFiYS5jb20KClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGlu
dGVsLmNvbT4gaW4gWzFdLgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFs
bC8yMDI2MDUxMjEzNTAud1p4QjUxazAtbGtwQGludGVsLmNvbS8KClRoYW5rcywKRmFuZ3l1Cgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

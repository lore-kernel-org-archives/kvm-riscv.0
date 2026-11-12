Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A25606A33B
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dy15qLZc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yH7XyaP8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2shzBEhQi6gJv+EGl302E2TwIZHDKQBP7gjy703Pi+4=; b=dy15qLZc+yAAJkVlEVgtl69VZl
	mskQzmeEZbazHZkgyID8sY8lEHgQLfoxGhvh8y6JWrHkRwI4Owsjr5p6rbFYTRrzjcWJ221HALfZg
	RGNlnh2up9Owex2fiOjBIwsmX9TRqulzVDH+mRQTqxcv5jHs1vA3/vv+f+OwpM0zbUyr4xcHBsZqr
	aMdxL1O/9E/juVOwtKoaHIr4dsZTXR24b5K4USm/CYpZ0B8Q/oCv029kI4dG2cMDF2mUttPCPTyWj
	C5vYmOuLUjnMHih9RKNsAxZj7Bpx7a3C/lAhQ1DHSIDljnujTe/kwTMuUpI1YbbdwLfxCTKUL1uNs
	4plcyP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKLA-00000008URA-2miq;
	Thu, 12 Nov 2026 02:15:04 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKL6-00000008UQH-1MCO;
	Thu, 12 Nov 2026 02:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794449694; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=1xCaH4HUY4jE9shdiHIoND7z6gJxF6tiu/0JOdXHPA4=;
	b=yH7XyaP8QSJyiw3Il9T/GynPjqkX21pmeASQXdYBGEDauat7XdXeAFyEvaamu37VtvQpl3GKJTiHqpeyCiaio4+jpAQU+SmjDWrT77r6J4HRhwbXHdQ84mxRD5RwwMjyRYiDm264yG8cVKAzHETgjnJlLcadGKsfVoxZneR0nnw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R821e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XEaSUOK_1794449689;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XEaSUOK_1794449689 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Nov 2026 10:14:51 +0800
From: fangyu.yu@linux.alibaba.com
To: tanchi25@mails.ucas.ac.cn
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Thu, 12 Nov 2026 10:14:48 +0800
Message-Id: <20261112021448.48441-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261111150249.13262-1-tanchi25@mails.ucas.ac.cn>
References: <20261111150249.13262-1-tanchi25@mails.ucas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_181501_742343_8A77F7C8 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PkhpIEZhbmd5dSwKPgo+VGhlIGZvbGxvd2luZyBRRU1VIHBhdGNoIHNlcmllcyBhZGRzIHN1cHBv
cnQgZm9yIGF1dG9tYXRpYyBQVEUgQS9EIHVwZGF0ZXMgdGhyb3VnaCBBTU9fSFdBRDoKPgo+aHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDI2MTEwODE0MzkzNC4xMjk5MjMtMS10
YW5jaGkyNUBtYWlscy51Y2FzLmFjLmNuLwo+Cj5JdCBtYXkgYmUgdXNlZnVsIGZvciB0aGUgZW5k
LXRvLWVuZCBkaXJ0eSB0cmFja2luZyB0ZXN0cyBtZW50aW9uZWQgaW4geW91ciBmb2xsb3ctdXAg
d29yaywKPnBhcnRpY3VsYXJseSBmb3IgdGVzdGluZyBHLXN0YWdlIGRpcnR5LWJpdCB1cGRhdGVz
IHRyaWdnZXJlZCBieSBETUEgd3JpdGVzLgo+Cj5JZiB5b3Ugbm90aWNlIGFueSBpc3N1ZXMgd2l0
aCB0aGUgaW1wbGVtZW50YXRpb24sIGZlZWRiYWNrIHdvdWxkIGJlIHZlcnkgd2VsY29tZS4KPgoK
SGkgVGFuIENoaSwKClRoYW5rcyBmb3IgeW91ciB3b3JrIG9uIGFkZGluZyBIV0FEIHN1cHBvcnQg
aW4gUUVNVS4gSW4gdGhlIG5leHQKdmVyc2lvbiwgSeKAmWxsIGluY2x1ZGUgeW91ciBwYXRjaCBp
biBteSB0ZXN0IHNldHVwIGFuZCBydW4gdGhlCnJlbGF0ZWQgdGVzdHMgdGhlcmUuCgpUaGFua3Ms
CkZhbmd5dQoKPlRoYW5rcywKPlRhbiBDaGkKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

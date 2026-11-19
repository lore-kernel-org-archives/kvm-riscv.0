Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8356260A260B
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s2VkhRz+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AA2pLmcv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1DIgrG740qlSaPkWjNwkViRjoHcP8RQloJbhljoXmCw=; b=s2VkhRz+VNzSWWrd9u93Z26QA0
	aezSMuFEb5lusWrxHDg1RNiiCgKt5BXc/bl2+X5fmvRW35y90S0TmiswHiS0yeo0dETlGJB6hD9de
	WlUXiOvIG+GrzXvTTMIe84qjOaDGBm3yXvZ7rQcvgEccB5jSRINHywtcWIGvusqrAv1hWyALT83H4
	fxCo47gnUAYxBp7j46q7KB/XWqCip4570MKiMTRm5Ra9kHhvDfa49UKr7OWyFbYRs6fC8wELVFVNn
	Vht3Lv/QoKsb9eqxrLFO600aZcy6sIijMsjIixNZhKI2PqBKBWzNCe29Or44LlVdoBkjTuS2ASx1r
	cjup8MwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Z7-0000000C852-1Dd2;
	Thu, 19 Nov 2026 13:52:41 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Z5-0000000C82N-1Iwl;
	Thu, 19 Nov 2026 13:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795096351; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=H3giZ1HYF1OcJ1XjNTKZ+B+MBp99vdaKlXFDCF5Fp3w=;
	b=AA2pLmcvLUibOsUcL/FalonEJ5YlXIGuy4nEIiAai8KfmjFGPN1BYgwUQP85uYoSe5hrLpNmk+XOmfRBi+5SUR4PY9S2LMVKAwCguo/fHnmV+ehW54zZaZYgKFdpi10E7jNT7XzmZhE8G00iInyaevrMPbJNjWP4b+VMIzSi/Bs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XF3fKam_1795096347;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XF3fKam_1795096347 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 19 Nov 2026 21:52:29 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
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
	tanchi25@mails.ucas.ac.cn,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Thu, 19 Nov 2026 21:52:22 +0800
Message-Id: <20261119135222.55990-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261118061848.184844-1-gong.shuai@sanechips.com.cn>
References: <20261118061848.184844-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055239_534774_61ED376F 
X-CRM114-Status: UNSURE (   3.50  )
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

PkhpIEZhbmd5dSwKPgo+V2Ugc2hvdWxkIGFkZCAic2VsZWN0IElPTU1VRkRfRFJJVkVSIGlmIElP
TU1VRkQiIGluCj5kcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcgdG8gZW5hYmxlIElPTU1VX0hX
UFRfR0VUX0RJUlRZX0JJVE1BUCwKPm90aGVyd2lzZSBpdCBhbHdheXMgcmV0dXJucyAtRU9QTk9U
U1VQUC4gSSBndWVzcyBpdCBiZWxvbmdzIGluIHRoZSBkaXJ0eQo+dHJhY2tpbmcgcGF0Y2guCgoK
SGkgU2h1YWksCgpUaGFua3MgZm9yIHRoZSBjYXRjaCDigJQgZ29vZCBwb2ludC4gSSdsbCBmb2xk
IHRoaXMgZml4IGludG8KdGhlIG5leHQgdmVyc2lvbi4KClRoYW5rcywKRmFuZ3l1Cgo+VGhhbmtz
LAo+U2h1YWkKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==

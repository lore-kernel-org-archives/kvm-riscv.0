Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DB8606A329
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2bzjvM5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=m08KhV0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iqlCQ1OWpVPXfPpdQoHsHHoYLNGt6ZEWXjS0275d5LI=; b=i2bzjvM5yszH9I0KKjRMl6FNsH
	QoTlwnaYLaaBL4SRBhQ9DUw0i5TZdC6crivM9ngtZW8r1/zNkiTx7EIa5spU/7blZw9rAAJL5TUJM
	y1UASob1FXauLhYG0jEq6zJtPRUMkfIkgQiF6BG2pG15448EJ3nHem34is8P2VOOddMin8zzKW2gE
	79Ywv2DN00LOt9Gt0e6OqpPH0Io2QdT1D0znnC1CUvpxTdoF5jvbEhaAFUfvheZ/cYogo8wBTIyPw
	zTafErYh88K85Z8Tcv7RyxlAo/FzXStGp+0VEf3E3R1c4vg3WHslIDJM4Xzn+QULLE3KK23eGBgRt
	fthVcqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYi0-000000054ia-2Cbk;
	Wed, 04 Nov 2026 10:59:12 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYhy-000000054fM-1PCH;
	Wed, 04 Nov 2026 10:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793789946; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=3nff9d/AA4m5vVgbnjj/6QnlBWUP9A3eO3LG2cNpO0Q=;
	b=m08KhV0fkxsfrfrjQiWp6HnWt8T+koWD1umEJghybHZAO3s6Qf6Jm3NiZccdI3RejYTik1tSWFB1jgRoGgRirlwwBvH5vgBJX5YZ2VerKPUC/oBEHXmL4YwXrJD0JKPAwSd2c3LHTYEb7wyizeUoO6jx5KNIf0rdOs/qlAL3jQQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XE5XI7y_1793789942;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE5XI7y_1793789942 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 18:59:04 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
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
	tjeznach@rivosinc.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 06/10] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch 
Date: Wed,  4 Nov 2026 18:59:01 +0800
Message-Id: <20261104105901.64207-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261104064540.115560-1-gong.shuai@sanechips.com.cn>
References: <20261104064540.115560-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_025910_550931_AD3AAC69 
X-CRM114-Status: UNSURE (   8.38  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PkhpIEZhbmd5dSwKPgo+PiBGcm9tOiBUb21hc3ogSmV6bmFjaCA8dGplem5hY2hAcml2b3NpbmMu
Y29tPgo+Pgo+PiBFbmFibGUgS1ZNL1ZGSU8gc3VwcG9ydCBvbiBSSVNDLVYgYXJjaGl0ZWN0dXJl
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogSmV6bmFjaCA8dGplem5hY2hAcml2b3NpbmMu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8u
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2t2bS9LY29uZmlnIHwgMiArKwo+PiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vS2NvbmZpZyBiL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcKPj4gaW5kZXggZjdlNGQwZjliMTU2
Li4xMzU1MmNmYzJjZDMgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcKPj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vS2NvbmZpZwo+PiBAQCAtMjgsOCArMjgsMTAgQEAgY29uZmln
IEtWTQo+PiAgCXNlbGVjdCBLVk1fR0VORVJJQ19IQVJEV0FSRV9FTkFCTElORwo+PiAgCXNlbGVj
dCBLVk1fR0VORVJJQ19QUkVfRkFVTFRfTUVNT1JZCj4+ICAJc2VsZWN0IFZJUlRfWEZFUl9UT19H
VUVTVF9XT1JLCj4+ICsJc2VsZWN0IEtWTV9WRklPCj4+ICAJc2VsZWN0IFNDSEVEX0lORk8KPj4g
IAlzZWxlY3QgR1VFU1RfUEVSRl9FVkVOVFMgaWYgUEVSRl9FVkVOVFMKPj4gKwlzZWxlY3QgU1JD
VQo+Cj5UaGlzIG9wdGlvbiBpcyBub3cgbWVhbmluZ2xlc3MsIHBsZWFzZSByZW1vdmUgaXQuCgpU
aGFua3MgZm9yIHRoZSBoZWFkcy11cC4KSeKAmWxsIHJlbW92ZSBpdCBmcm9tIHRoZSBuZXh0IHZl
cnNpb24uCgpUaGFua3MsCkZhbmd5dQoKPlNlZToKPmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjMwMTA1MDAzODEzLjE3NzAzNjctNS1wYXVsbWNrQGtlcm5lbC5vcmcvCj4K
PlRoYW5rcywKPlNodWFpCj4KPj4gIAloZWxwCj4+ICAJICBTdXBwb3J0IGhvc3RpbmcgdmlydHVh
bGl6ZWQgZ3Vlc3QgbWFjaGluZXMuCj4+Cj4+IC0tCj4+IDIuNTAuMQoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

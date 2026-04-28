Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C3FF8868
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xtO2HsDQmxTTN/dVfVFeQYDUXdYCV8llC9axqDcX2U4=; b=iXZrLH+diZGosC
	5sbgtBaAutWh2DNOXddp0F/Kcfx92BjHMj5AiYlXEg9DlN1zYEYpE1FpHOwHzMvrPS6qzZgfHZFZZ
	911+K//SWwjG1MHPKlkBsr97MDw9UbC8X7xKQgqaV2YHWN4wLpdeFpoqhVMMAzRCuJBL53Dc3FLqx
	dz+bi5EmsXdTzVJl2+eNW9nYxqvmFW4SeJj1HFGWquKmjPPCVOqULnMsFuEsMPbs513hlYCbqcDtN
	2Nfo92/wHBg7CLrYNszIzbiNFq1VtHAVZirAGxe2izszD9hUb64vEBvSzYJVDGdgz33+11ZMHFFzJ
	DjeQzpfUtUZdXOslmpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGk-00000001V0q-2Mev;
	Tue, 28 Apr 2026 13:14:30 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiGg-00000001UyS-2XCS;
	Tue, 28 Apr 2026 13:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777382058; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=2eUnDZEfxgG5YZ/aUJ43Dh+182ud/Kd1EhVPQjTWqdA=;
	b=xsmC5wAYnTQRZaE0N019Ocxzpf0XIO55wvWrCW7shGbqdsijN0JhIRJJrVmct1jLzsh15PTmLmXJuOeObeeQOLNZA+vnPfCjFJTs/2g4Bk3ZfrzkI4szu/ecDTfVmWh6UvM/qTHYE+fHaAEkL+qRneUvsd6sYncQxEAxS160qNM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X1ubICp_1777382049;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1ubICp_1777382049 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 28 Apr 2026 21:14:12 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tjeznach@rivosinc.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	baolu.lu@linux.intel.com,
	vasant.hegde@amd.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	skhawaja@google.com,
	jgg@nvidia.com
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH 00/11] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Tue, 28 Apr 2026 21:13:48 +0800
Message-Id: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_061427_682494_4B049C5F 
X-CRM114-Status: UNSURE (   8.54  )
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

RnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+CgpUaGUgUklTQy1W
IElPTU1VIGFyY2hpdGVjdHVyZSBkZWZpbmVzIGFuIEFNT19IV0FEIGNhcGFiaWxpdHkgKEhhcmR3
YXJlCkFjY2Vzcy9EaXJ0eSB1cGRhdGUpIHRoYXQgYWxsb3dzIHRoZSBJT01NVSB0byBhdG9taWNh
bGx5IHNldCB0aGUgQS9EIGJpdHMKaW4gc2Vjb25kLXN0YWdlIFBURXMgb24gRE1BIGFjY2Vzcy4g
IFdoZW4gREMudGMuR0FERSBpcyBhc3NlcnRlZCwgdGhlIElPTU1VCmF1dG9ub21vdXNseSBzZXRz
IEQgb24gdGhlIGZpcnN0IHdyaXRlIHRvIGEgcGFnZSBtYXBwZWQgYnkgYW4gaW9oZ2F0cApkb21h
aW4uICBUaGlzIHNlcmllcyB3aXJlcyB0aGF0IGNhcGFiaWxpdHkgdXAgdG8gdGhlIGlvbW11ZmQg
ZGlydHktdHJhY2tpbmcKaW50ZXJmYWNlIChJT01NVV9IV1BUX1NFVF9ESVJUWV9UUkFDS0lORyAv
IElPTU1VX0hXUFRfR0VUX0RJUlRZX0JJVE1BUCkgYW5kCnJlcG9ydHMgSU9NTVVfQ0FQX0RJUlRZ
X1RSQUNLSU5HLgoKRGVzaWduIG5vdGVzCi0tLS0tLS0tLS0tLQoKKiBUaGUgZmVhdHVyZSBpcyBz
Y29wZWQgdG8gc2Vjb25kLXN0YWdlIChpb2hnYXRwKSBkb21haW5zIG9ubHk7IHRoZXNlIGFyZQog
IHRoZSBkb21haW5zIGNyZWF0ZWQgZm9yIEtWTSAvIFZGSU8gZGV2aWNlIHBhc3MtdGhyb3VnaCB3
aGVuIHVzZXJzcGFjZQogIGFsbG9jYXRlcyBhbiBIV1BUIHdpdGggSU9NTVVfSFdQVF9BTExPQ19O
RVNUX1BBUkVOVCBvcgogIElPTU1VX0hXUFRfQUxMT0NfRElSVFlfVFJBQ0tJTkcuICBGaXJzdC1z
dGFnZSAoaW9zYXRwKSBkb21haW5zIGFyZSBub3QKICB0b3VjaGVkIGJ5IHRoaXMgc2VyaWVzLgoK
KiBUaGUgcGFnZS10YWJsZSBzaWRlIHBsdWdzIGludG8gdGhlIGV4aXN0aW5nIGdlbmVyaWNfcHQg
ZGlydHkgaG9vawogIGZyYW1ld29yayAoYW1kdjEgLyB2dGRzcyBzdHlsZSkuICBSSVNDLVYgYWRk
cyB0aGUgdGhyZWUgcmVxdWlyZWQgUFRFCiAgb3BzIOKAkyBpc193cml0ZV9kaXJ0eSAvIG1ha2Vf
d3JpdGVfY2xlYW4gLyBtYWtlX3dyaXRlX2RpcnR5LgoKVGVzdGluZwotLS0tLS0tCgoqIFRlc3Qg
b24gUUVNVSBSSVNDLVYsIGEgdmlydGlvLW5ldCBhbmQgYW4gZTEwMDBlIGRldmljZSB3YXMgcGFz
c2VkIHRocm91Z2gKICB0byBhbiBMMiBndWVzdCB2aWEgdmZpby1wY2kgKyBpb21tdWZkLgoKKiBn
ZW5lcmljX3B0IEtVbml0OiB0aGUgZXhpc3RpbmcgdGVzdF9kaXJ0eSBjYXNlIG5vdyBydW5zIGFu
ZCBwYXNzZXMgZm9yCiAgdGhlIFJJU0MtViA2NC1iaXQgZm9ybWF0LgoKRm9sbG93LXVwIHdvcmsK
LS0tLS0tLS0tLS0tLS0KKiBCdWlsZCBhIGRlZGljYXRlZCBlbmQtdG8tZW5kIHRlc3QgY2FzZSB0
aGF0IGRyaXZlcyB0aGUgZnVsbCBmbG93CiAgKEhXUFRfQUxMT0Mgd2l0aCBESVJUWV9UUkFDS0lO
RyAtPiBhdHRhY2ggLT4gSU9BU19NQVAgLT4gZ2VuZXJhdGUgcmVhbAogIERNQSAtPiBTRVRfRElS
VFlfVFJBQ0tJTkcgLT4gR0VUX0RJUlRZX0JJVE1BUCAtPiB2ZXJpZnkgYml0bWFwIGFnYWluc3QK
ICBleHBlY3RlZCBJT1ZBIGZvb3RwcmludCkgc28gdGhhdCB0aGUgYmVoYXZpb3VyIGNhbiBiZSBy
ZWdyZXNzaW9uLXRlc3RlZAogIGJleW9uZCB0aGUgS1VuaXQgUFRFLWxldmVsIGNvdmVyYWdlLgoK
KiBJZiBwb3NzaWJsZSwgcmViYXNlIGFuZCByZXRlc3Qgb24gdG9wIG9mIHRoZSB1cGRhdGVkICJp
b21tdSBpcnFieXBhc3MiCiAgcGF0Y2hzZXQuCgoKRmFuZ3l1IFl1ICg2KToKICBpb21tdXB0OiBB
ZGQgUklTQy1WIFNlY29uZC1zdGFnZSAoaW9oZ2F0cCkgcGFnZSB0YWJsZSBzdXBwb3J0CiAgaW9t
bXUvcmlzY3Y6IEFkZCBkb21haW5fYWxsb2NfcGFnaW5nX2ZsYWdzIGZvciBzZWNvbmQtc3RhZ2Ug
ZG9tYWluCiAgaW9tbXVwdDogRG9uJ3QgcHJlc2V0IEQgd2hlbiBSSVNDLVYgSU9NTVUgZGlydHkg
dHJhY2tpbmcgb24KICBpb21tdS9yaXNjdjogQWRkIGRpcnR5IHRyYWNraW5nIHN1cHBvcnQgZm9y
IHNlY29uZC1zdGFnZSBkb21haW5zCiAgaW9tbXUvcmlzY3Y6IEFkZCBJT1RJTlZBTC5HVk1BIGFm
dGVyIHVwZGF0aW5nIEREVC9QRFQgZW50cmllcwogIGlvbW11cHQ6IEFkZCBSSVNDLVYgZGlydHkg
dHJhY2tpbmcgUFRFIG9wcwoKVG9tYXN6IEplem5hY2ggKDIpOgogIGlvbW11L3Jpc2N2OiByZXBv
cnQgaW9tbXUgY2FwYWJpbGl0aWVzCiAgUklTQy1WOiBLVk06IEVuYWJsZSBLVk1fVkZJTyBpbnRl
cmZhY2VzIG9uIFJJU0MtViBhcmNoCgpab25nIExpICgzKToKICBpb21tdS9yaXNjdjogdXNlIGRh
dGEgc3RydWN0dXJlIGluc3RlYWQgb2YgaW5kaXZpZHVhbCB2YWx1ZXMKICBpb21tdS9yaXNjdjog
c3VwcG9ydCBHU0NJRCBhbmQgR1ZNQSBpbnZhbGlkYXRpb24gY29tbWFuZAogIGlvbW11L3Jpc2N2
OiBzdXBwb3J0IG5lc3RlZCBpb21tdSBmb3IgZ2V0dGluZyBpb21tdSBoYXJkd2FyZQogICAgaW5m
b3JtYXRpb24KCiBhcmNoL3Jpc2N2L2t2bS9LY29uZmlnICAgICAgICAgICAgICAgfCAgIDIgKwog
ZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNjdi5oIHwgMTIwICsrKysrKysrKysrKy0K
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtYml0cy5oICAgICB8ICAgNyArCiBkcml2ZXJzL2lv
bW11L3Jpc2N2L2lvbW11LmMgICAgICAgICAgfCAyNDcgKysrKysrKysrKysrKysrKysrKysrKyst
LS0tCiBpbmNsdWRlL2xpbnV4L2dlbmVyaWNfcHQvY29tbW9uLmggICAgfCAgMTMgKysKIGluY2x1
ZGUvbGludXgvZ2VuZXJpY19wdC9pb21tdS5oICAgICB8ICAxNyArLQogaW5jbHVkZS91YXBpL2xp
bnV4L2lvbW11ZmQuaCAgICAgICAgIHwgIDE4ICsrCiA3IGZpbGVzIGNoYW5nZWQsIDM4MyBpbnNl
cnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKCi0tIAoyLjUwLjEKCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4C5CD343F
	for <kvm-riscv@archiver.kernel.org>; Thu,  7 May 2026 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fAmIVWCHEYioD6xtqXcjsiupdPHpKRmglbzwhErzDWA=; b=uw+BGk19EAD4Y+
	IFgNkPvKQuKUW5doQryUpwvkyfjP6QpETgn+xocUB2SRLQ+XCDpw8sjJWE9ANLwb98bj/eK2YPThW
	jPFV3DHVN48I0f5vkrrvOxuF82UC1fB7qNR5/hVEfUK90Zl2JfkNgkxxXkEG2WEji8gJNWuUsNBD8
	3BTnrDNcQp5dobeZ/22SNGbLlUXgWoOxS6Rel1efh/y21HNGtssOkuGz5X2oheJeYvgFXKG7KgBAH
	YyIeloetrYHho9i2hhYETQyq0ZZ/fVPTBotjCQBZtCeyBEfrVb6c6tc9TKS2qTV/eb9z7UIT8YOO3
	otQbh/zXJn85t02xggAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx2l-00000003eem-2nNj;
	Thu, 07 May 2026 11:37:27 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx2g-00000003eay-3Jqe;
	Thu, 07 May 2026 11:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778153836; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=pYPOjk5vRxc6PyCVSBrJamgrCDH5JWFpBbo0/9xzAQk=;
	b=Y72oo2r4PdMzG3/u/HPmMrQXfNrQqiLYIk4c14U8V2kOxi/sz1AmGrdjC8LH456+jW8HIyUODbNHX3V9tWivnEGrOUmdKdUkL/nPacOchca1ULsm7yOtVM5/l9ZGsDosP6pxVwRdh4oh8HCBnzKpxjnBG4vfAzkHtfAyEuB4v+Q=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X2UVEza_1778153829;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2UVEza_1778153829 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 May 2026 19:37:11 +0800
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
	andrew.jones@oss.qualcomm.com,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH v2 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Thu,  7 May 2026 19:36:56 +0800
Message-Id: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_043724_108973_ADA08B15 
X-CRM114-Status: UNSURE (   8.74  )
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
b21tdSBpcnFieXBhc3MiCiAgcGF0Y2hzZXQuCgotLS0KQ2hhbmdlcyBpbiB2MiAoSmFzb24ncyBz
dWdnZXN0aW9ucyk6CiAgICAtIEludHJvZHVjZWQgYSBzaW5nbGUgUFRfRkVBVF9SSVNDVl9TMjog
c2Vjb25kLXN0YWdlIHNlbGVjdGlvbiBpcyBkcml2ZW4KICAgICAgcHVyZWx5IGJ5IHRoaXMgZmVh
dHVyZSBiaXQuCiAgICAtIFN3aXRjaGVkIGZyb20gZHluYW1pYyBEQy50Yy5HQURFIHRvZ2dsaW5n
IHRvIHN0YXRpYyBwcmUtZW5hYmxlLgogICAgLSBkb21haW5fYWxsb2NfcGFnaW5nX2ZsYWdzOiBm
b2xsb3cgdGhlIHN3aXRjaC9jYXNlIGRlc2lnbiBmcm9tIG90aGVyCiAgICAgIGRyaXZlcnMuCiAg
ICAtIERyb3AgSU9NTVVfQ0FQX0RFRkVSUkVEX0ZMVVNIIGluIHJpc2N2X2lvbW11X2NhcGFibGUu
CiAgICAtIFJlbW92ZSB0aGUgLmh3X2luZm8tcmVsYXRlZCBwYXRjaC4KICAgIC0gTGluayB0byB2
MToKICAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjA0MjgxMzEz
NTkuMzQ4NzItMS1mYW5neXUueXVAbGludXguYWxpYmFiYS5jb20vCgpGYW5neXUgWXUgKDYpOgog
IGlvbW11cHQ6IEFkZCBSSVNDLVYgU2Vjb25kLXN0YWdlIChpb2hnYXRwKSBwYWdlIHRhYmxlIHN1
cHBvcnQKICBpb21tdXB0OiBBZGQgUklTQy1WIGRpcnR5IHRyYWNraW5nIFBURSBvcHMKICBpb21t
dS9yaXNjdjogQWRkIGRvbWFpbl9hbGxvY19wYWdpbmdfZmxhZ3MgZm9yIHNlY29uZC1zdGFnZSBk
b21haW4KICBpb21tdS9yaXNjdjogUHJlLWVuYWJsZSBHQURFIGZvciBzZWNvbmQtc3RhZ2UgZG9t
YWlucwogIGlvbW11L3Jpc2N2OiBBZGQgZGlydHkgdHJhY2tpbmcgc3VwcG9ydCBmb3Igc2Vjb25k
LXN0YWdlIGRvbWFpbnMKICBpb21tdS9yaXNjdjogQWRkIElPVElOVkFMLkdWTUEgYWZ0ZXIgdXBk
YXRpbmcgRERUL1BEVCBlbnRyaWVzCgpUb21hc3ogSmV6bmFjaCAoMik6CiAgaW9tbXUvcmlzY3Y6
IHJlcG9ydCBpb21tdSBjYXBhYmlsaXRpZXMKICBSSVNDLVY6IEtWTTogRW5hYmxlIEtWTV9WRklP
IGludGVyZmFjZXMgb24gUklTQy1WIGFyY2gKClpvbmcgTGkgKDIpOgogIGlvbW11L3Jpc2N2OiB1
c2UgZGF0YSBzdHJ1Y3R1cmUgaW5zdGVhZCBvZiBpbmRpdmlkdWFsIHZhbHVlcwogIGlvbW11L3Jp
c2N2OiBzdXBwb3J0IEdTQ0lEIGFuZCBHVk1BIGludmFsaWRhdGlvbiBjb21tYW5kCgogYXJjaC9y
aXNjdi9rdm0vS2NvbmZpZyAgICAgICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvaW9tbXUvZ2Vu
ZXJpY19wdC9mbXQvcmlzY3YuaCB8IDEwNCArKysrKysrKysrKysrKy0KIGRyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUtYml0cy5oICAgICB8ICAgNyArCiBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMgICAgICAgICAgfCAxOTAgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCiBpbmNsdWRlL2xp
bnV4L2dlbmVyaWNfcHQvY29tbW9uLmggICAgfCAgIDUgKy0KIGluY2x1ZGUvbGludXgvZ2VuZXJp
Y19wdC9pb21tdS5oICAgICB8ICAxNyArKy0KIDYgZmlsZXMgY2hhbmdlZCwgMjc3IGluc2VydGlv
bnMoKyksIDQ4IGRlbGV0aW9ucygtKQoKLS0gCjIuNTAuMQoKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

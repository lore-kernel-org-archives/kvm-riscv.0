Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357E1F3ED79
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWRjQEajBSl9lRv7vpWDpBLGze/7+8Ret/cOZE8hRFs=; b=rgEFKT7Th1Bi9w
	OmWQoxIfEiFXBBwsyJrPncm6uhHu1AJk+cV7WZvWJ1JJEzcsqgZ+KqXtGSf12k6IMpv8YumFB/t7Y
	4nHodab2w9/+6J5Jin1oVeeFbPsIvDjShclSuYkKljGDNmV4E3U0gCPcuBZIgeozBIth59ViBmnDl
	b61fsg5lXzRoc6TLGr0VZkJW+rLjVcetTDQtPL8uJhwJA2SFnoVqgid0p+GbzWhvuieJmxSSr1Xx6
	4SpRrOLDQ2/js2yzEoZ4i2Fu59pjkyDkdOE7oG7hlv1s6y8eLVe54DYeiyvNBCjcCSCf+qdj6IC51
	a5SaPgwf13a7N1uzfTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFbB-0000000Fa9K-3hxN;
	Mon, 13 Apr 2026 11:37:01 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFb9-0000000Fa8w-1FvU;
	Mon, 13 Apr 2026 11:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776080215; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=AnyIHNbrDxqyBLIAAV2HhBqSqqIJqc6RZL+OmGgzoOQ=;
	b=N5VGs7Y/8+FFn3eStXWshT03AXxodFUw6mJKZ9CQz7hAIitVeiQhX6s1CavlGRW3eQg4DODw5zP84OnBajXntWJG/enG+Zf7woLxy04iq+0q2f+nwDnjRXBns+Fe86tdn0n8ZlzdaCc4SYcQnWXdqlHjWTYLWrrpMI6MI4Sw7Sk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0vg84-_1776080210;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0vg84-_1776080210 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 13 Apr 2026 19:36:51 +0800
From: fangyu.yu@linux.alibaba.com
To: kevin.tian@intel.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: RE: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits  
Date: Mon, 13 Apr 2026 19:36:45 +0800
Message-Id: <20260413113645.28757-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <BN9PR11MB52766502D575970096482F428C242@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <BN9PR11MB52766502D575970096482F428C242@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_043659_916361_EC5A7821 
X-CRM114-Status: GOOD (  12.96  )
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

Pj4gRnJvbTogZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tIDxmYW5neXUueXVAbGludXguYWxp
YmFiYS5jb20+Cj4+IFNlbnQ6IFNhdHVyZGF5LCBBcHJpbCAxMSwgMjAyNiAxMDoyMiBBTQo+Pgo+
PiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPj4KPj4gV2hl
biB0aGUgUklTQy1WIElPTU1VIHBhZ2UgdGFibGUgZm9ybWF0IHN1cHBvcnQgU3ZwYm10LCBQQk1U
IHByb3ZpZGVzCj4+IGEgd2F5IHRvIHRhZyBtYXBwaW5ncyB3aXRoIHBhZ2UtYmFzZWQgbWVtb3J5
IHR5cGVzLiBFbmNvZGUgbWVtb3J5IHR5cGUKPj4gdmlhIFBCTVQgaW4gUklTQy1WIElPTU1VIFBU
RXM6Cj4+Cj4+ICAgLSBJT01NVV9NTUlPICAgLT4gUEJNVD1JTwo+PiAgIC0gIUlPTU1VX0NBQ0hF
IC0+IFBCTVQ9TkMKPgo+SW4gY29uY2VwdCBJT01NVV9DQUNIRSBpcyBjbGVhcmVkIHdoZW4gSU9N
TVVfTU1JTyBpcyBzZXQuIEZyb20gdGhlCj5jb2RlIFBCTVQ9SU8gaW4gdGhpcyBjYXNlLgo+Cj5T
byBzdHJpY3RseSBzcGVha2luZyB0aGUgMm5kIGxpbmUgc2hvdWxkIGJlOgo+Cj4gIC0gIUlPTU1V
X01NSU8gJiYgIUlPTU1VX0NBQ0hFIC0+IFBCTVQ9TkMKPgo+Pz8KPgoKQWdyZWUuIEknbGwgY2xh
cmlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgYWNjb3JkaW5nbHkgdG8gYXZvaWQgaW1wbHlpbmcKdGhh
dCB0aGUgTU1JTyBjYXNlIGNvdWxkIGZhbGwgaW50byB0aGUgTkMgcnVsZS4KCj4+ICAgLSBvdGhl
cndpc2UgICAgLT4gUEJNVD1Ob3JtYWwgKFBCTVQ9MCkKPj4KPj4gQ2xlYXIgdGhlIFBCTVQgZmll
bGQgYmVmb3JlIGFwcGx5aW5nIHRoZSBzZWxlY3RlZCBlbmNvZGluZywgYW5kIG9ubHkKPj4gdG91
Y2ggUEJNVCB3aGVuIFBUX0ZFQVRfUklTQ1ZfU1ZQQk1UIGlzIGFkdmVydGlzZWQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+PiAt
LS0KPj4gIGRyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaCB8IDkgKysrKysrKysr
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L3Jpc2N2LmgKPj4gYi9kcml2ZXJzL2lvbW11L2dl
bmVyaWNfcHQvZm10L3Jpc2N2LmgKPj4gaW5kZXggYTdmZWY2MjY2YTM2Li4wMjA1MWJiM2M2ZTUg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaAo+PiAr
KysgYi9kcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQvZm10L3Jpc2N2LmgKPj4gQEAgLTU4LDYgKzU4
LDggQEAgZW51bSB7Cj4+ICAJUklTQ1ZQVF9HID0gQklUKDUpLAo+PiAgCVJJU0NWUFRfQSA9IEJJ
VCg2KSwKPj4gIAlSSVNDVlBUX0QgPSBCSVQoNyksCj4+ICsJUklTQ1ZQVF9OQyA9IEJJVCg2MSks
Cj4+ICsJUklTQ1ZQVF9JTyA9IEJJVCg2MiksCj4+ICAJUklTQ1ZQVF9SU1cgPSBHRU5NQVNLKDks
IDgpLAo+PiAgCVJJU0NWUFRfUFBOMzIgPSBHRU5NQVNLKDMxLCAxMCksCj4KPnNvcnQgYnkgYml0
IHBvc2l0aW9ucwo+CgpHb3QgaXQsIHdpbGwgcmVvcmRlciBpbiB2Mi4KCj4+Cj4+IEBAIC0yMzcs
NiArMjM5LDEzIEBAIHN0YXRpYyBpbmxpbmUgaW50IHJpc2N2cHRfaW9tbXVfc2V0X3Byb3Qoc3Ry
dWN0Cj4+IHB0X2NvbW1vbiAqY29tbW9uLAo+PiAgCQlwdGUgfD0gUklTQ1ZQVF9SOwo+PiAgCWlm
ICghKGlvbW11X3Byb3QgJiBJT01NVV9OT0VYRUMpKQo+PiAgCQlwdGUgfD0gUklTQ1ZQVF9YOwo+
PiArCWlmIChjb21tb24tPmZlYXR1cmVzICYgQklUKFBUX0ZFQVRfUklTQ1ZfU1ZQQk1UKSkgewo+
PiArCQlwdGUgJj0gflJJU0NWUFRfUEJNVDsKPgo+dGhpcyBpcyB1bm5lY2Vzc2FyeSBkdWUgdG8g
dGhlIGVhcmxpZXIgYXNzaWdubWVudDoKPgo+CXB0ZSA9IFJJU0NWUFRfQSB8IFJJU0NWUFRfVTsK
PgoKQXMgdGhpbmdzIHN0YW5kIGl04oCZcyBub3QgbmVlZGVkLCBJJ2xsIGRyb3AgaXQgaW4gdjIu
Cgo+PiArCQlpZiAoaW9tbXVfcHJvdCAmIElPTU1VX01NSU8pCj4+ICsJCQlwdGUgfD0gUklTQ1ZQ
VF9JTzsKPj4gKwkJZWxzZSBpZiAoIShpb21tdV9wcm90ICYgSU9NTVVfQ0FDSEUpKQo+PiArCQkJ
cHRlIHw9IFJJU0NWUFRfTkM7Cj4+ICsJfQo+Pgo+PiAgCS8qIENhbGxlciBtdXN0IHNwZWNpZnkg
YSBzdXBwb3J0ZWQgY29tYmluYXRpb24gb2YgZmxhZ3MgKi8KPj4gIAlpZiAodW5saWtlbHkoKHB0
ZSAmIChSSVNDVlBUX1ggfCBSSVNDVlBUX1cgfCBSSVNDVlBUX1IpKSA9PSAwKSkKPj4gLS0KPj4g
Mi41MC4xCgpUaGFua3MsCkZhbmd5dQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK

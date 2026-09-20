Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86623C982CC
	for <kvm-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 07:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYz96mskmL4oPaZQVUGIJIvJdqNh5ZIu0aGTSzzhQ/Y=; b=4Q3j6LO2OamQqP
	K9BpJzS9TJV/I4zrIRypFowW1qXRM81/VutVQR9kaewWbFdvlfzFOuP6JEqJEVRP5D76/tuCnOtXK
	dWPBvK3mgErGunkD3bfkNVoCK7JSjprN2mwN4gN1nyIofWquGsO/YUt7BCdkzYeFryfArhPMQZiQd
	926UeiXh/rh4YbxYuyzVl5qC9ySH0oIQn3Cax+fb+Myqv8jfkowkKqBDZ4mTcWQ36ue78zhsb39K8
	DCAs8qvYtMudEIt46DqJSnIGgIEw+FdYqv+60ZS6UWJnhMEsr88dWl/OqqX0rKuMImGJ7uoPrG9iZ
	fWTDyhTV5KtZ7dGKBM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CCY-0000000H3b4-05ZI;
	Sun, 20 Sep 2026 07:43:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8CCW-0000000H3aH-1WQ7;
	Sun, 20 Sep 2026 07:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nnCjHaq5u459BP4esI2iP1Ogb+B55p2baz8QQLyndy0=; b=cPvIBY4KsEpTxbGL76efmGbuHi
	mn+v2f1bJe2ebONksklql5y5ElOcrV7XGhjz9tKa1tBIjqQzZe9WHn09qadO+d49q45hG9SZd/BA5
	3Lo/YBCO4KSHnjcGbE0aLHyidOT5Klpoh60Sbf91flTAd0rIPJd3YJrPhYAGzT06q6Ap77uoJ7h9y
	1L0xDHInLoiTWIp2aLMYBsiqnXTOqe1JgYi5x9DEo8k5IGHHmj7e/q2Ay59g2j/ofyjXSU8QafjT/
	z7sjiyCidpX73v3F+fmnrkr6Szxc1OlUJKsPm+UXgwQWa38flJ+kkXDgo1ctEOQLcFCNuUZJk3ezu
	DxMDxxAQ==;
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8CCK-0000000BFvP-3slB;
	Sun, 20 Sep 2026 07:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789890159; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=nnCjHaq5u459BP4esI2iP1Ogb+B55p2baz8QQLyndy0=;
	b=mLUQY4AbuPHH/K7ax8HZtWRTBo6x2RfhI/Q29RBtxTPZCfMrpsBXI0djUfHS7IltJFnNplEgEfCvn89xzMT/bNbykzPay7uDCf5ONQankCWNe2HwA5d44vKFfocvNFx4qb/4rS3SzV8GXePdI7aJ8jjIopVr3qP9sl4voBuRxRw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XBFJGoU_1789890155;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XBFJGoU_1789890155 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 20 Sep 2026 15:42:37 +0800
From: fangyu.yu@linux.alibaba.com
To: gsh517025@gmail.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
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
Subject: Re: [RFC PATCH v4 08/10] iommu/riscv: Pre-enable GADE for second-stage domains 
Date: Sun, 20 Sep 2026 15:42:34 +0800
Message-Id: <20260920074234.45479-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <8572d404-8a33-4cd3-a14f-ebff7c2ac487@gmail.com>
References: <8572d404-8a33-4cd3-a14f-ebff7c2ac487@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_084254_714764_1581377B 
X-CRM114-Status: GOOD (  21.74  )
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

PkhpIEZhbmd5dSwKPgo+T24gOS8yMC8yMDI2IDExOjEyIEFNLCBmYW5neXUueXVAbGludXguYWxp
YmFiYS5jb20gd3JvdGU6Cj4+PkhpIEZhbmd5dSwKPj4+Cj4+Pk9uIDkvMTUvMjAyNiAxMToyOCBB
TSwgZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tIHdyb3RlOgo+Pj4+IEZyb206IEZhbmd5dSBZ
dSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4+Cj4+Pj4gUHJlLWVuYWJsZSBSSVND
Vl9JT01NVV9EQ19UQ19HQURFIGluIHRoZSBkZXZpY2UgY29udGV4dCB3aGVuCj4+Pj4gYXR0YWNo
aW5nIGEgc2Vjb25kLXN0YWdlIGRvbWFpbiwgaWYgdGhlIElPTU1VIHN1cHBvcnRzIEFNT19IV0FE
Lgo+Pj4+Cj4+Pj4gU29mdHdhcmUgcHJlLXBvcHVsYXRlcyBzZWNvbmQtc3RhZ2UgcGFnZSB0YWJs
ZXMgd2l0aCBEIHNldCwgc28KPj4+PiBlbmFibGluZyBHQURFIGJ5IGRlZmF1bHQgZG9lcyBub3Qg
Y2hhbmdlIG5vcm1hbCBiZWhhdmlvci4gV2hlbgo+Pj4+IGRpcnR5IHRyYWNraW5nIGlzIGVuYWJs
ZWQsIGlvbW11ZmQgY2xlYXJzIHRoZSBwcmUtc2V0IEQgYml0cyBhbmQKPj4+PiBHQURFIGJlY29t
ZXMgbmVjZXNzYXJ5IGZvciBoYXJkd2FyZSB0byB1cGRhdGUgdGhlIGRpcnR5IGJpdCBvbgo+Pj4+
IHdyaXRlIGFjY2Vzcy4KPj4+Pgo+Pj4+IFRoaXMgYXZvaWRzIHRvZ2dsaW5nIEdBREUgZHluYW1p
Y2FsbHkgYW5kIGtlZXBzIGRldmljZSBjb250ZXh0Cj4+Pj4gc2V0dXAgY29uc2lzdGVudCB3aXRo
IHNlY29uZC1zdGFnZSBkb21haW4gYXR0YWNobWVudC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4+IC0tLQo+Pj4+ICAg
ZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIHwgMiArKwo+Pj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+Pj4+IGluZGV4IDE2Nzc5
ODc3MzUxYi4uZjAxZmQ0ZTJmODQwIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvaW9tbXUuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+Pj4+IEBA
IC0xMzMwLDYgKzEzMzAsOCBAQCBzdGF0aWMgaW50IHJpc2N2X2lvbW11X2F0dGFjaF9wYWdpbmdf
ZG9tYWluKHN0cnVjdCBpb21tdV9kb21haW4gKmlvbW11X2RvbWFpbiwKPj4+PiAgIAkJCUZJRUxE
X1BSRVAoUklTQ1ZfSU9NTVVfRENfSU9IR0FUUF9NT0RFLCBwdF9pbmZvLmlvaGdhdHBfbW9kZSkg
fAo+Pj4+ICAgCQkJRklFTERfUFJFUChSSVNDVl9JT01NVV9EQ19JT0hHQVRQX0dTQ0lELCBkb21h
aW4tPmdzY2lkKSB8Cj4+Pj4gICAJCQlGSUVMRF9QUkVQKFJJU0NWX0lPTU1VX0RDX0lPSEdBVFBf
UFBOLCBwdF9pbmZvLnBwbik7Cj4+Pj4gKwkJaWYgKGlvbW11LT5jYXBzICYgUklTQ1ZfSU9NTVVf
Q0FQQUJJTElUSUVTX0FNT19IV0FEKQo+Pj4+ICsJCQlkYy50YyB8PSBSSVNDVl9JT01NVV9EQ19U
Q19HQURFOwo+Pgo+PiBIaSBTaHVhaToKPj4KPj4+Cj4+PkkgbWlnaHQgYmUgbWlzc2luZyBzb21l
dGhpbmcsIGJ1dCBJIGRvbid0IHNlZSBob3cgdGhlIEdBREUgYml0IHNldAo+Pj5oZXJlIHJlYWNo
ZXMgdGhlIGhhcmR3YXJlIElPTU1VIERDLiBJbiByaXNjdl9pb21tdV9pb2Rpcl91cGRhdGUoKQo+
Pj4oaW4gcGF0Y2ggMDQvMTApLCBpdCBsb29rcyBsaWtlIG9ubHkgdGhlIFYgYml0IGlzIHRha2Vu
Ogo+Pj4KPj4+CXRjID0gUkVBRF9PTkNFKGRjLT50Yyk7Cj4+Pgl0YyB8PSBuZXdfZGMtPnRhICYg
UklTQ1ZfSU9NTVVfRENfVENfVjsKPj4+CS4uLgo+Pj4JV1JJVEVfT05DRShkYy0+dGMsIHRjKTsK
Pj4+Cj4+Cj4+IFlvdeKAmXJlIHJpZ2h0IOKAlCB0aGlzIGlzIGEgcmVhbCBpc3N1ZS4KPj4KPj4g
R0FERSB3YXMgYmVpbmcgc2V0IGluIHRoZSBzb2Z0d2FyZS1zaWRlIGRjLCBidXQgaXQgd2FzIG5v
dAo+PiBwcm9wYWdhdGVkIGludG8gdGhlIGhhcmR3YXJlIERDIGluIHJpc2N2X2lvbW11X2lvZGly
X3VwZGF0ZSgpLgo+Pgo+PiBJIGhhdmUgYWxyZWFkeSBmaXhlZCB0aGlzIGluIG15IGxvY2FsIHRy
ZWUsIGFuZCBJ4oCZbGwgaW5jbHVkZSB0aGUKPj4gY2hhbmdlIGluIHRoZSBuZXh0IHZlcnNpb24g
b2YgdGhlIHBhdGNoc2V0Ogo+PiAgICAgIHRjICY9IH5SSVNDVl9JT01NVV9EQ19UQ19HQURFOwo+
PiAgICAgIHRjIHw9IG5ld19kYy0+dGMgJiBSSVNDVl9JT01NVV9EQ19UQ19HQURFOwo+PiAgICAg
IHRjIHw9IG5ld19kYy0+dGEgJiBSSVNDVl9JT01NVV9EQ19UQ19WOwo+Pgo+Cj5PbmUgdGhvdWdo
dCBoZXJlLCBpbnN0ZWFkIG9mIHVwZGF0aW5nIGluZGl2aWR1YWwgVEMgYml0cyBvbmUgYnkgb25l
Cj5pbiByaXNjdl9pb21tdV9pb2Rpcl91cGRhdGUoKSwgY291bGQgd2UgdHJhbnNmZXIgYWxsIHNv
ZnR3YXJlLWNvbmZpZ3VyYWJsZQo+Yml0cyBmcm9tIHRoZSBpbmNvbWluZyBEQyB0byB0aGUgaGFy
ZHdhcmUgREMgaW4gb25lIGdvPwo+Cj5Tb21ldGhpbmcgbGlrZToKPgkuLi4KPgl0YyA9IChSRUFE
X09OQ0UoZGMtPnRjKSAmIH5HRU5NQVNLX1VMTCgxMSwgMCkpIHwKPgkJIChuZXdfZGMtPnRjICYg
R0VOTUFTS19VTEwoMTEsIDApKTsKPgkuLi4KPglXUklURV9PTkNFKGRjLT50YywgdGMpOwo+Cj5J
4oCZbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY291bGQgaGF2ZSBuZWdhdGl2ZSBzaWRlIGVmZmVj
dHMuCj4KCkhpIFNodWFpOgoKVGhhdCBpcyBhIHJlYXNvbmFibGUgaWRlYSBpbiBwcmluY2lwbGUu
CgpIb3dldmVyLCBUQyBiaXRzIG1heSBoYXZlIGRpZmZlcmVudCBsaWZldGltZXMgYW5kCnVwZGF0
ZSBydWxlcywgYW5kIHNldmVyYWwgZmVhdHVyZXMgc3VjaCBhcyBBVFMgYW5kClBSSSBhcmUgc3Rp
bGwgbm90IGltcGxlbWVudGVkIHlldC4KCkZvciBub3csIEkgd291bGQgcHJlZmVyIHRvIGtlZXAg
dGhlIGNoYW5nZSBtaW5pbWFsCmFuZCBvbmx5IGhhbmRsZSBHQURFIGhlcmUuCgpPbmNlIHRoZSBy
ZW1haW5pbmcgZmVhdHVyZXMgYXJlIGluIHBsYWNlLCB3ZSBjYW4KY29uc2lkZXIgYSBicm9hZGVy
IGNsZWFudXAgYW5kIHVuaWZ5IHRoZSBoYW5kbGluZwpvZiB0aGVzZSBiaXRzLgoKVGhhbmtzLApG
YW5neXUKCj4+Pkkgc2F3IHRoYXQgeW91IG1lbnRpb25lZCB5b3UgdGVzdGVkIGl0IG9uIFFFTVUu
IEFzIGZhciBhcyBJIGtub3csCj4+Pm1haW5saW5lIFFFTVUgaGFzIG5vdCB5ZXQgZGVjbGFyZWQg
dGhlIEFNT19IV0FEIGNhcGFiaWxpdHkuIENvdWxkCj4+PnlvdSBjbGFyaWZ5IHdoZXRoZXIgeW91
IHVzZWQgYSBtb2RpZmllZCBRRU1VIGZvciB0aGlzIHRlc3Q/Cj4+Pgo+Pgo+PiBJIHVzZWQgbWFp
bmxpbmUgUUVNVSwgbm90IGEgbW9kaWZpZWQgb25lLgo+Pgo+PiBJbiBRRU1VLCBJIG9ubHkgdGVz
dGVkIHRoZSBzZWNvbmQtc3RhZ2UgcGF0aCB3aXRoIGEKPj4gVk0gdXNpbmcgZGV2aWNlIHBhc3N0
aHJvdWdoLgo+Pgo+PiBJIGRpZCBub3QgdGVzdCB0aGUgZGlydHktbG9nIHJlbGF0ZWQgcGFydCB0
aGVyZSwKPj4gc28gdGhhdCBwYXRoIGNhbm5vdCBiZSBjb3ZlcmVkIHRoZXJlLgo+Pgo+PiBUaGF0
IGlzIHdoeSBJIG5vdGVkIGluIHRoZSBUT0RPIHRoYXQgSSB3aWxsIGJ1aWxkIGEKPj4gZGVkaWNh
dGVkIHRlc3QgY2FzZSBmb3IgZGlydHkgbG9nIGhhbmRsaW5nIGxhdGVyLgo+Cj5Tb3JyeSwgSSBt
aXNzZWQgdGhhdCBUT0RPLgo+Cj4KPlRoYW5rcywKPlNodWFpCj4KCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C64E937E1
	for <kvm-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qphBRcF/82R2LUcvnMSCZBD3lgzo7xTnK2g2C39zhU=; b=Gdi+rCCl3y22Ut
	S/qc3LCs+9JWueV58xPJgP/fH6kzxLrbe4XQnuz6VYmlA5aDEblOFak97DCBsb3nldzyyPZpQ6ouI
	Me3viy5kX6zerpBXP26F3Qv6FaehEa7Bcj8/h8IWKFi6dChM4dOcN00FaJCIru0xOS8hy3x2qM1c7
	okq+ZfIO+uyq2bsGDn2poWomTf8R+/5xNJbnCcTfXskwD03OKHBffcV1YzTI/S8waX3DKlkTonM2Y
	/FFLn9NLL6JXGz4PSqE6I8bM01WqBzJsC8M/nvhoY60To86zcgNK5RsZHty2TQMKwtCbhv6avd6ki
	7xVnlujYCYAjPnE5a4yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvUI-0000000EMNp-3Uqd;
	Sun, 12 Apr 2026 14:08:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvUG-0000000EMNS-46w8
	for kvm-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 14:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01C976091C
	for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 14:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EB2C2BCB7
	for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 14:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776002911;
	bh=pUaZBofqyiHuJdKG/enoIrmnfmfGyZY0tKTyJtHdNeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QCUHkeC/lWY1eEbswyN4H5ZM36Gg7F3hsPCtnpn6VdMtpF5tKVwr0zCWjAE45jjD7
	 qbJWcGs88NRboXCKLMeEIQWLGWxiMLBQYOf7XYKxNN9yBaUVoiSJBMjhED1C8ktVkc
	 2ZWUjIxiy0Wz7ndJ/oHPMtcoxlCwq3HyH3ZjGFY67lpfTXQe7UgMVOAwvc6RFlwruA
	 0hBfiajjwr1JH8mvV3l9EwEGC/Oc1zJ73UKjk6whSMKPJ1YOLV0noEV0arFUCruKnP
	 FCBEy8zb/QalsQAZugoLsVquT5CekJJSrH46ugbZDfz8EFJklyy0bXxffLHf+auAHr
	 4/9xswFXXuE+Q==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so2299921f8f.0
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 07:08:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/UDC2tCrLkp4fWNMuEZ1FdtBHzpVIMHR1MTtAOLN4SZTKgvp1o4gwQex5ufA9Z6gg072dMaYHa0R4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvwAw5ibBL2nfj35ohZvnWUcV36XDwTqbu6kB664XPjk2Y31c6
	JK65owdbVt5EBRO9jva7cC5vFFYJgd6OLDpDuY0gjG2N4oBSUQl9PCIXGEWEgZ9y23SAug+lw19
	ZiyxNmyZu8FSLJ4k3VAd5DPhBPAkKgbg=
X-Received: by 2002:a5d:5f46:0:b0:43c:f8b4:e58 with SMTP id
 ffacd0b85a97d-43d642c088fmr14300636f8f.41.1776002910085; Sun, 12 Apr 2026
 07:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com> <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 12 Apr 2026 22:08:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSq-JT3TWJ5C_zBP+8_fVC7vNYCq_7eiMVT0X+4sM5ceA@mail.gmail.com>
X-Gm-Features: AQROBzC4Rc4aMZc6sUhMK9JYRkMncLQ0Cgf8xyWGV5aVeZpU8wsqLom86aWm950
Message-ID: <CAJF2gTSq-JT3TWJ5C_zBP+8_fVC7vNYCq_7eiMVT0X+4sM5ceA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V
 Svpbmt bits
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com, 
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gU2F0LCBBcHIgMTEsIDIwMjYgYXQgMTA6MjLigK9BTSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJh
YmEuY29tPiB3cm90ZToKPgo+IEZyb206IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJh
YmEuY29tPgo+Cj4gV2hlbiB0aGUgUklTQy1WIElPTU1VIHBhZ2UgdGFibGUgZm9ybWF0IHN1cHBv
cnQgU3ZwYm10LCBQQk1UIHByb3ZpZGVzCj4gYSB3YXkgdG8gdGFnIG1hcHBpbmdzIHdpdGggcGFn
ZS1iYXNlZCBtZW1vcnkgdHlwZXMuIEVuY29kZSBtZW1vcnkgdHlwZQo+IHZpYSBQQk1UIGluIFJJ
U0MtViBJT01NVSBQVEVzOgo+Cj4gICAtIElPTU1VX01NSU8gICAtPiBQQk1UPUlPCj4gICAtICFJ
T01NVV9DQUNIRSAtPiBQQk1UPU5DCj4gICAtIG90aGVyd2lzZSAgICAtPiBQQk1UPU5vcm1hbCAo
UEJNVD0wKQo+Cj4gQ2xlYXIgdGhlIFBCTVQgZmllbGQgYmVmb3JlIGFwcGx5aW5nIHRoZSBzZWxl
Y3RlZCBlbmNvZGluZywgYW5kIG9ubHkKPiB0b3VjaCBQQk1UIHdoZW4gUFRfRkVBVF9SSVNDVl9T
VlBCTVQgaXMgYWR2ZXJ0aXNlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1
Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lvbW11L2dlbmVyaWNfcHQv
Zm10L3Jpc2N2LmggfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNjdi5o
IGIvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNjdi5oCj4gaW5kZXggYTdmZWY2MjY2
YTM2Li4wMjA1MWJiM2M2ZTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0
L2ZtdC9yaXNjdi5oCj4gKysrIGIvZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNjdi5o
Cj4gQEAgLTU4LDYgKzU4LDggQEAgZW51bSB7Cj4gICAgICAgICBSSVNDVlBUX0cgPSBCSVQoNSks
Cj4gICAgICAgICBSSVNDVlBUX0EgPSBCSVQoNiksCj4gICAgICAgICBSSVNDVlBUX0QgPSBCSVQo
NyksCj4gKyAgICAgICBSSVNDVlBUX05DID0gQklUKDYxKSwKPiArICAgICAgIFJJU0NWUFRfSU8g
PSBCSVQoNjIpLAo+ICAgICAgICAgUklTQ1ZQVF9SU1cgPSBHRU5NQVNLKDksIDgpLAo+ICAgICAg
ICAgUklTQ1ZQVF9QUE4zMiA9IEdFTk1BU0soMzEsIDEwKSwKPgo+IEBAIC0yMzcsNiArMjM5LDEz
IEBAIHN0YXRpYyBpbmxpbmUgaW50IHJpc2N2cHRfaW9tbXVfc2V0X3Byb3Qoc3RydWN0IHB0X2Nv
bW1vbiAqY29tbW9uLAo+ICAgICAgICAgICAgICAgICBwdGUgfD0gUklTQ1ZQVF9SOwo+ICAgICAg
ICAgaWYgKCEoaW9tbXVfcHJvdCAmIElPTU1VX05PRVhFQykpCj4gICAgICAgICAgICAgICAgIHB0
ZSB8PSBSSVNDVlBUX1g7Cj4gKyAgICAgICBpZiAoY29tbW9uLT5mZWF0dXJlcyAmIEJJVChQVF9G
RUFUX1JJU0NWX1NWUEJNVCkpIHsKPiArICAgICAgICAgICAgICAgcHRlICY9IH5SSVNDVlBUX1BC
TVQ7Cj4gKyAgICAgICAgICAgICAgIGlmIChpb21tdV9wcm90ICYgSU9NTVVfTU1JTykKPiArICAg
ICAgICAgICAgICAgICAgICAgICBwdGUgfD0gUklTQ1ZQVF9JTzsKPiArICAgICAgICAgICAgICAg
ZWxzZSBpZiAoIShpb21tdV9wcm90ICYgSU9NTVVfQ0FDSEUpKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHB0ZSB8PSBSSVNDVlBUX05DOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICAvKiBDYWxs
ZXIgbXVzdCBzcGVjaWZ5IGEgc3VwcG9ydGVkIGNvbWJpbmF0aW9uIG9mIGZsYWdzICovCj4gICAg
ICAgICBpZiAodW5saWtlbHkoKHB0ZSAmIChSSVNDVlBUX1ggfCBSSVNDVlBUX1cgfCBSSVNDVlBU
X1IpKSA9PSAwKSkKPiAtLQo+IDIuNTAuMQo+CkknbSBva2F5IHdpdGggdGhlIGN1cnJlbnQgd2F5
IG9mICBNTUlPICYgQ0FDSEUgbWFwcGluZyB0byBJTyAmIE5DLgoKUmV2aWV3ZWQtYnk6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

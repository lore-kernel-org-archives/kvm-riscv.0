Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5F1E937E4
	for <kvm-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4B+h6LXBXuBTuomZYOjUajs3hO30Nytuvd2yXnYsrO0=; b=EmyhFXND9gzOzI
	s/Gj7YW9Z3niPnPjvy2w0MeRWMahW61pJgo4yMnOxWL2pHSuwhvaAiZnV/YvMPROnWP1bMaktm4xi
	NmSY0+e+N7nPNurMi1NA0oYTwC7p8skIEgPS+yLp/cAfS4b1M92o5GldExWk23bDe6A5QZetkUz5Q
	ROYyadru/LzEj+Oa12+HmQ42NUy1IYKDAmNHEqYkazM+Eo/eEqVpu+2WeHjAhpbn3XAFO/joMXyRB
	v1y0MADuwlNiG8k0LQCdrYFbthNpmLoZO06Scu6Tg2sG2Y4aOb9O+STGcaT0F5pS4Lsed1BebvzIh
	reZM8TvnNtii4ReYAEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBuU0-0000000EJj3-20HG;
	Sun, 12 Apr 2026 13:04:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBuTx-0000000EJiP-3IJx
	for kvm-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 13:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D8DE44222
	for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 13:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB814C2BCB0
	for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775999047;
	bh=5Bqrbn2k9TOdsiAH38KQq4JwdpFH359AVe8NrWa9IHY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=acUj9fiOeaIPYUxTvtPLJcosDRTm64YAp4LKVYnU4ri5zy7WTcjd2zHdmtfSeqz6G
	 B/6KLCdyGRhgHC0C7ICkJK2fEBM1vUdyVXT5DDDgng6T0/vVKvMueSnux7qIaVV/4B
	 jXGmaIKJprr7yrzN+81/1mRNTsuJt5xtdfyqcZp99kTEpEA0NAvmlVPPFSzGQRdt+2
	 /XhB4xA5ZMZBshCh55mJ9on1Ni1ADrnXhstPusW/FVNiYAaDa+m3JZQKF0SdQtHskK
	 lk7bm9vTbHq55ODDzZTisrnaunnZTs8K+do0It33t/wk21RWGK4QN1b6mc+sPJ96Iw
	 07DJoT/hP6qBg==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d70b3e159so193508f8f.0
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 06:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+21WbP2k4yqFQzOb8thOoq1kG+x74veisGqWA+ezJtk17xwzfOYY3+df9lNJA2K+lE1KRNXjow+qs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxG81Ldq2/Aq12YC5oEwmddGM4qtlldlY9PX4ECsU+qxMevAHku
	/svQe/qwhPGPDj0/Ys6SBBanP9Lrgno6s916rSA9IJi2RPC9B2r4wvLbcbBaZXryZSCrugpfXyg
	dXwBjhHqtQjgJsxfSZ5zaJLiNwZvVvCM=
X-Received: by 2002:a05:6000:26cf:b0:43d:613:4036 with SMTP id
 ffacd0b85a97d-43d642be547mr13803956f8f.37.1775999046355; Sun, 12 Apr 2026
 06:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com> <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 12 Apr 2026 21:03:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSXnUA2nAnVE=wMvW-=rcKj6a8f8DFTaSs+uEu6YfLgLA@mail.gmail.com>
X-Gm-Features: AQROBzA6Z2M_85dwJnKtYOBK9MfzLI4lmy3tM3YGVlERgho4gFxSwFBRusnFW8A
Message-ID: <CAJF2gTSXnUA2nAnVE=wMvW-=rcKj6a8f8DFTaSs+uEu6YfLgLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic page table
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com, 
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, iommu@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_060409_864429_5541BCC3 
X-CRM114-Status: GOOD (  15.38  )
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
YmEuY29tPgo+Cj4gVGhlIFJJU0MtViBJT01NVSBjYW4gb3B0aW9uYWxseSBzdXBwb3J0IFN2cGJt
dCBwYWdlLWJhc2VkIG1lbW9yeSB0eXBlcwo+IGluIGl0cyBwYWdlIHRhYmxlIGZvcm1hdC4gV2hl
biBwcmVzZW50LHRoZSBnZW5lcmljIHBhZ2UgdGFibGUgY29kZSBjYW4KPiB1c2UgdGhpcyBjYXBh
YmlsaXR5IHRvIGVuY29kZSBtZW1vcnkgYXR0cmlidXRlcyAoZS5nLiBNTUlPIHZzIG5vcm1hbAo+
IG1lbW9yeSkgaW4gUFRFcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1
QGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMg
ICAgICAgfCAyICsrCj4gIGluY2x1ZGUvbGludXgvZ2VuZXJpY19wdC9jb21tb24uaCB8IDEgKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+IGlu
ZGV4IGM3ZDAzNDJhYTc0Ny4uZTUzODgzOTM1NTYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+IEBA
IC0xMTk0LDYgKzExOTQsOCBAQCBzdGF0aWMgc3RydWN0IGlvbW11X2RvbWFpbiAqcmlzY3ZfaW9t
bXVfYWxsb2NfcGFnaW5nX2RvbWFpbihzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICAgICAgICBjZmcu
IGNvbW1vbi5mZWF0dXJlcyA9IEJJVChQVF9GRUFUX1NJR05fRVhURU5EKSB8Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQklUKFBUX0ZFQVRfRkxVU0hfUkFOR0UpIHwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBCSVQoUFRfRkVBVF9SSVNDVl9TVk5BUE9UXzY0Syk7Cj4g
KyAgICAgICBpZiAoaW9tbXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfU1ZQQk1U
KQo+ICsgICAgICAgICAgICAgICBjZmcuY29tbW9uLmZlYXR1cmVzIHw9IEJJVChQVF9GRUFUX1JJ
U0NWX1NWUEJNVCk7Cj4gICAgICAgICBkb21haW4tPnJpc2N2cHQuaW9tbXUubmlkID0gZGV2X3Rv
X25vZGUoaW9tbXUtPmRldik7Cj4gICAgICAgICBkb21haW4tPmRvbWFpbi5vcHMgPSAmcmlzY3Zf
aW9tbXVfcGFnaW5nX2RvbWFpbl9vcHM7Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9n
ZW5lcmljX3B0L2NvbW1vbi5oIGIvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2NvbW1vbi5oCj4g
aW5kZXggZmM1ZDBiNWVkYWRjLi5kZmFkZjhhNTc1MmEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9nZW5lcmljX3B0L2NvbW1vbi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0
L2NvbW1vbi5oCj4gQEAgLTE4OCw2ICsxODgsNyBAQCBlbnVtIHsKPiAgICAgICAgICAqIFN1cHBv
cnQgdGhlIDY0ayBjb250aWd1b3VzIHBhZ2Ugc2l6ZSBmb2xsb3dpbmcgdGhlIFN2bmFwb3QgZXh0
ZW5zaW9uLgo+ICAgICAgICAgICovCj4gICAgICAgICBQVF9GRUFUX1JJU0NWX1NWTkFQT1RfNjRL
ID0gUFRfRkVBVF9GTVRfU1RBUlQsCj4gKyAgICAgICBQVF9GRUFUX1JJU0NWX1NWUEJNVCwKPgo+
ICB9Owo+Cj4gLS0KPiAyLjUwLjEKPgoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgoKCi0tCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

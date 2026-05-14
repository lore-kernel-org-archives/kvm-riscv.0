Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CB5CD4F39
	for <kvm-riscv@archiver.kernel.org>; Thu, 14 May 2026 17:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r9mfF3dWh5oaiGIxhX9Vx6RfIT8tlJtbM5F2gMw/2s=; b=Lh/i9AlUicoNoH
	+I3mUEk5zp0SaVEkt2CtoYAqx2O974xmsU4dR1vYyqQ19QufC0cvrTRbnLaWL0FsfzU64EbVKDwxs
	Y2AR17D3IhaAKK3ZiLKAD18+l4R3Ca5uoPs0S+OLETv0bJPN7CJ/jMTdnM8ykgAk/f1V8NSYnRTA0
	sQ72rHgaZ3oH6fCo5km272Px+jM3DtmINUoxBbuw0g2Z6TeJndSS4/+oqDGPm7gbTa1qIU37pt1pm
	Gasvqu24qYeGqfB/CK9Vbc41D3f/4DlI8po1mrRu0/NCXuwU/w+nfOweRlSskcZi+Woc2owOz6HGI
	H0/KhSNSQxNGcr5QhoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa3K-00000006EBl-0a5o;
	Thu, 14 May 2026 17:40:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNa3G-00000006EAS-3EnR
	for kvm-riscv@lists.infradead.org;
	Thu, 14 May 2026 17:40:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45d96d21e82so731211f8f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 14 May 2026 10:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778780449; x=1779385249; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KnaJVAZDC++uQU8uHfAQulgEWlG+rcJqqh5PyI/aA3o=;
        b=fRgOre7jFRoy30N/21bQ7kNQB9UWKi9kqXONXoXDCCUuARVBrJ7ZaVCK9y++xqpMpL
         /ZCJzRpoLtviw86UtQYNrHdAj9lrphwjYy5+AbeiDBAmp7gja3OCY+Uw3m1VhXwL0pmz
         CxFMH2WzmaHioLGdQXEvaN2z20WxC2YkCxT4yYUTrVcZU9JnkfzcKJp5h5u2K9WlMxVZ
         SBSoKCx13+uya3t+qXd61cHXlaZvvAKs01CINflFCPyUN7MOadPzwNE2WjEGH7O15aKs
         y4bfiNWf1tUhknnxd1onDpz77QHTBifsVg6ItDy6XlL566Ank5JLK5Nmy870ZN5CVIom
         IasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778780449; x=1779385249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnaJVAZDC++uQU8uHfAQulgEWlG+rcJqqh5PyI/aA3o=;
        b=Bry1QcqH9RN8DTmZMh5/0G7vEotiblYl89NXHEw2H3AUN9nH8YnXSOj8gSaafBLa8M
         Jang4ehbnAsC4lWBQK1JVbCSxpZiDYJAzIXhNGie/Ln1EaYLn72rNMNTD8iSJGwuKEPC
         sJ6nEjN13MdDMNG9hDHmDYyi1tniRnHKrY0Tfh2GSzAFIZLQQmq4i2F3DH43Ra6PWdKT
         moLX8+JWj0/i3FlTPgBYIWScX173+WAy1Q6P2hKeDOsOHKeGRUTQBbIJnObRhwQv1Dbo
         RjYkcWZLQi47ZdaYiR/lq1At5yntnpxr3AvFt7hEPrFk3SeLyxppYygwrnpvg+miN+gt
         a0og==
X-Forwarded-Encrypted: i=1; AFNElJ/980i0D/8YTHOD9ei4CvgF0AX4kdrikzW7tlwXmsZBua9VX5+6GJQSExLYTixl2HR0LrcBWdoj/Zw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJv2R6yc3Z6m5ui9Ur0dV/dA82rmkDPCz1P76wG264cWj4Vj7Y
	uH5/uizuA1oaBqm+yc8fHO0e5KU1axuqD6xnZLe156mdlsxIDwXAIdPB
X-Gm-Gg: Acq92OFdd8lVtrwG30a7gIa7Oy+drbspfhTTAbExL9Yo6ymmv8I0Ylh05R2S5KYtllN
	cPaX4wb8EOvUnKPTmn3ZBEndjBA0Zntckt65iFwPGXTeR/+eyZj1skCG1qA4BRgRksmUC0Xl2nS
	JCUVO/k7Gz5ieV9D82ApYpgDGw9/vDdEyZeROfz4Tt/OJ3XboyTjdTT6jcwNRVBpsFPBin0F+dI
	Xl3RG+2OSPru3xNHqgGfvWfn3YcCtXjfcXsSMSsNNyKyKg0uRREsunAbS1LZf5w6SrU5tIfks7a
	1tdrh3iSOvIEgD+NC58dBRP3gWycq5lGyOMM7nTmGCAOG1O57eeloDrucAUC55OmqAH0KXGPkbR
	bYayZWfIBpSwbgz3oVZGFyFU5fU2fU3CfpNNbDEBekJ3j458vKaSPqiW4Hs9ssCB2xog4ZOdomc
	7Jl9yCAwqWHzd9+bTEQqyEe4djriG4ogKPMmpwGSOBpQhjaXobUwDeSbfDKg==
X-Received: by 2002:a05:6000:2c06:b0:45d:4fc0:fe0a with SMTP id ffacd0b85a97d-45e5c5dd346mr66055f8f.32.1778780448681;
        Thu, 14 May 2026 10:40:48 -0700 (PDT)
Received: from osama ([2a02:908:1b6:8980:4f8c:d716:5699:930b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed2ffdfsm7481200f8f.15.2026.05.14.10.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:40:48 -0700 (PDT)
Date: Thu, 14 May 2026 19:40:46 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] riscv: kvm: return SBI_ERR_FAILURE for PMU shmem OOM
Message-ID: <agYJHrUHeSq_m788@osama>
References: <20260415220930.287592-1-osama.abdelkader@gmail.com>
 <CAAhSdy3LpnWtc9iTnND2ez4WK8WJUF_edYaDfD9Nd8_F3dPJFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3LpnWtc9iTnND2ez4WK8WJUF_edYaDfD9Nd8_F3dPJFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_104050_820430_92C190D3 
X-CRM114-Status: GOOD (  21.51  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMDc6MTM6MDRQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIEFwciAxNiwgMjAyNiBhdCAzOjQw4oCvQU0gT3NhbWEgQWJkZWxrYWRlcgo+
IDxvc2FtYS5hYmRlbGthZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4ga3ZtX3Jpc2N2X3Zj
cHVfcG11X3NuYXBzaG90X3NldF9zaG1lbSgpIGFuZCBrdm1fcmlzY3ZfdmNwdV9wbXVfZXZlbnRf
aW5mbygpCj4gPiByZXR1cm5lZCAtRU5PTUVNIGZyb20gdGhlIFNCSSBleHRlbnNpb24gaGFuZGxl
ciwgd2hpY2ggY2F1c2VkCj4gPiBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoKSB0byBhYm9ydCBL
Vk1fUlVOIGFuZCBzdXJmYWNlIHRoZSBlcnJvciB0bwo+ID4gdXNlcnNwYWNlIGluc3RlYWQgb2Yg
Y29tcGxldGluZyB0aGUgRUNBTEwgd2l0aCBhIG5lZ2F0aXZlIFNCSSBlcnJvciBpbiBhMC4KPiA+
IFVzZSBTQklfRVJSX0ZBSUxVUkUgYW5kIHRoZSBub3JtYWwgcmV0ZGF0YSBwYXRoLCBtYXRjaGlu
ZyBvdGhlciBQTVUKPiA+IGhhbmRsZXJzIGFuZCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBjb21t
ZW50Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE9zYW1hIEFiZGVsa2FkZXIgPG9zYW1hLmFiZGVs
a2FkZXJAZ21haWwuY29tPgo+IAo+IFNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcyB3aGVyZToK
PiAKPiAxKSBPbmUgcGF0Y2ggZml4aW5nIGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRf
c2htZW0oKQo+IDIpIFNlY29uZCBwYXRjaCBmaXhpbmcga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50
X2luZm8oKQo+IAo+IE1ha2Ugc3VyZSB0byBhZGQgRml4ZXMgdGFnIGluIGJvdGggcGF0Y2hlcy4K
PiAKPiBSZWdhcmRzLAo+IEFudXAKClRoYW5rcyBBbnVwIGZvciB0aGUgcmV2aWV3LCBJIGp1c3Qg
ZGlkIHRoYXQuCgpSZWdhcmRzLApPc2FtYQoKPiAKPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmMgfCAxMiArKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ID4gaW5kZXggZTg3
MzQzMGU1OTZiLi5mMzZiMDk5ZjQ0N2MgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3BtdS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gPiBAQCAtNDM1
LDggKzQzNSwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90X3NldF9zaG1lbShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcwo+ID4gICAgICAgICB9Cj4gPgo+
ID4gICAgICAgICBrdnBtdS0+c2RhdGEgPSBremFsbG9jKHNuYXBzaG90X2FyZWFfc2l6ZSwgR0ZQ
X0FUT01JQyk7Cj4gPiAtICAgICAgIGlmICgha3ZwbXUtPnNkYXRhKQo+ID4gLSAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgICBpZiAoIWt2cG11LT5zZGF0YSkgewo+ID4g
KyAgICAgICAgICAgICAgIHNiaXJldCA9IFNCSV9FUlJfRkFJTFVSRTsKPiA+ICsgICAgICAgICAg
ICAgICBnb3RvIG91dDsKPiA+ICsgICAgICAgfQo+ID4KPiA+ICAgICAgICAgLyogTm8gbmVlZCB0
byBjaGVjayB3cml0YWJsZSBzbG90IGV4cGxpY2l0bHkgYXMga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3Qg
ZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4gPiAgICAgICAgIGlmIChrdm1fdmNwdV93cml0ZV9ndWVz
dCh2Y3B1LCBzYWRkciwga3ZwbXUtPnNkYXRhLCBzbmFwc2hvdF9hcmVhX3NpemUpKSB7Cj4gPiBA
QCAtNDgwLDggKzQ4MiwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8oc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNhZGRyX2xvdwo+ID4gICAgICAgICB9
Cj4gPgo+ID4gICAgICAgICBlaW5mbyA9IGt6YWxsb2Moc2htZW1fc2l6ZSwgR0ZQX0tFUk5FTCk7
Cj4gPiAtICAgICAgIGlmICghZWluZm8pCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9N
RU07Cj4gPiArICAgICAgIGlmICghZWluZm8pIHsKPiA+ICsgICAgICAgICAgICAgICByZXQgPSBT
QklfRVJSX0ZBSUxVUkU7Cj4gPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArICAgICAg
IH0KPiA+Cj4gPiAgICAgICAgIHJldCA9IGt2bV92Y3B1X3JlYWRfZ3Vlc3QodmNwdSwgc2htZW0s
IGVpbmZvLCBzaG1lbV9zaXplKTsKPiA+ICAgICAgICAgaWYgKHJldCkgewo+ID4gLS0KPiA+IDIu
NDMuMAo+ID4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DC3CA9EBE
	for <kvm-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=by2Be4uaz5g8Jra3ngxAiQzpeIa8kZSncHBf1fK8Ktg=; b=hsA9eS2OOUJPKx
	W649sbxVfk41ZqxgOtcDKE9rdgTa6yXHNWTJYQNW4GJkT0aLrWHcmDRd+GcUAXe19GmE4RZFKe6Bc
	RduKL7USFwFB0ukuJJDxh2f2Q/1d6a08bu8KyGHrJbtp23wJbEeKEbVYELcFiQckI8FPu+5C1fNk0
	Pctnta1zJy2lmwOOYvMmp5AtZ36GUiUNwPJuXGz9ARkAKyaX9+z1jkr5xLaVJOc5mZAM6Gum4heQI
	D/GfF2MQk4SdFqL0O12tWXbcN6+mOCxBB2vLyx+OE8o2iIBTrZ0kMoV6cPRKej46K/YeaIaiJLUTL
	2OPF66s9lWblKF7EehBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSMq-00000007eq3-1CA7;
	Sat, 10 Oct 2026 08:23:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSMn-00000007epK-3Olf
	for kvm-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 08:23:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso5664595e9.3
        for <kvm-riscv@lists.infradead.org>; Sat, 10 Oct 2026 01:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791620620; x=1792225420; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5mq0tskx+tUcwnAnhupVpLRdLNZbwAvDfFkOVLvFKw=;
        b=VHlnGNy+0ajTYy0Q6TMQz3vpz6E8zd/j23uemGgceIV0SZTYCucw1TJdy2CCLtO8hc
         i9n6hqrDRHV6PWNFsN5euTkyexKLaWkPsR0ju4kXVEcEFoy3CcuxmMDaS7mzmdC1XDR9
         zBBWESBen6sR1WDIbKdtRakKs2223P9pvsFC3CWpV/+F/raRou+XZCijLGTBkIxbHK8m
         yR9Y08LnTpxNQBG5Ko1LxGXeLFHOLOMGxJBMH+N1CcKCbIv6JGfG7Un8X3xJPPVpXfhM
         P8XzCDK9wgBJrtRHCBCelprlFs2n9t6+kIIEFHum2cj4ba+Nqcsw9ipo/P+9dKdA3H0B
         nLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620620; x=1792225420;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5mq0tskx+tUcwnAnhupVpLRdLNZbwAvDfFkOVLvFKw=;
        b=gJZiaKNz6WLXPF77D4SJM39jIxHhG7wPgTKjkEZOhAudXDl1u/q5WKApQwUXuR4XOT
         1U5EjrPQw28GRSMz4PySi9ZPiym07eNiy7fuMXKm7JsEcXNYwWLDlEfZjNJQCrevBAKE
         5//R/TK03eEHZFF4oAJc01nJek3sd9Du4UvlPjfOOOQzZTwF4JnlZ4D29f5ZXcqFfB1q
         yWRIugd0kbW5jZnMQSlpIzr15tbzf/K7GaDRyjmyKn2WWwPFmRe3isfBWTTH3MsLehrA
         NiTtowt5wQUQGMnASlUX3l7CHAoza9Na5+tQ4WKL0ktmKsrpo5wp0cHtT8hG0dS+eASV
         R7/A==
X-Forwarded-Encrypted: i=1; AKwUvByWMB3vSFrVQj9u3D6f2ODb8xmJVGmRMunYRvNgmZqY/fR/OmbHpyPlGlTc9wli1q05psSNYpD1xkw=@lists.infradead.org
X-Gm-Message-State: AFq9FYLa63+wWMsb5NHKZ+CJhadLGXVTVABj9PvqO9RCQwLloSf+d3Yb
	GkZBiduRaS/eqmF8dUAoLmRmuZY0J4+jCcJ6t+aLuaS0AYXIJPqVT/a9xMX2ZqWYBEU=
X-Gm-Gg: AYBFou1Y6cqo5KVLPQRZcmHVB0mARUq1Tm0ulMFdXSqw/bLuAYExNjd32GJkAT+TpVr
	pDVkzZQtqMHyPhgp82DCfS3IJ44OH0P7dahM3HZXeET5nLSBKa+vJ+qX8o8sVkMc4o4EafGNOG2
	XtjMtHACV/Evahzpk/Q3cDUItk+h6JzYATjiSYI8djRF0cdwW6SAosmpB8FoKDtl7KPNnS5dQrM
	kymWlIVcH5jJAWahLdObuI9tFmjn4X9ETAOoG9mcfwvCqb+uooZ23nwWgU6+tr8pAVCnk7hsCr3
	Epe9a9qMRodK81RWukdVxEGhKBfVAkVgPLccxa9cPd+YlpVh36ePuAZweFMNmDE61Tc8ZLtpUJW
	UvitzXFsVcIG0lFPYaoM4LgKf6G5/kCF/NYl1NgVuyRdFIrGmOMFsuhV3P/hbkQ17PBMzAe9iwy
	KO9/oJ4mCbwzx5FFD8U2UEx0BuiBFfX/73Yv4WA4ZyVvxKsY/jEFy4bxYdwX/xTEPEsIZW1Q==
X-Received: by 2002:a05:600c:8216:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a18e4b0465mr83021825e9.20.1791620620009;
        Sat, 10 Oct 2026 01:23:40 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.65.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm70330535e9.0.2026.10.10.01.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 01:23:39 -0700 (PDT)
Message-ID: <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
Date: Sat, 10 Oct 2026 10:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
To: Anup Patel <anup@brainfault.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org
References: <20260827211209.2871124-1-dave@stgolabs.net>
 <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_012341_908263_68D4CBD5 
X-CRM114-Status: GOOD (  18.99  )
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

SGkgQW51cCwKCk9uIDIwMjYtMTAtMDkgOToyMyBQTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBU
aHUsIEF1ZyAyNywgMjAyNiBhdCAxMToxMuKAr1BNIERhdmlkbG9ociBCdWVzbyA8ZGF2ZUBzdGdv
bGFicy5uZXQ+IHdyb3RlOgo+Pgo+PiBzZW52Y2ZnIGFycml2ZWQgaW4gcHJpdmlsZWdlZCBzcGVj
IDEuMTIsIGJ1dCBILWNhcGFibGUgY29yZXMgb24gYQo+PiAxLjExIGJhc2UgZXhpc3QsIGllOiBz
aWZpdmUgUDUwMCAoRVNXSU4gRUlDNzcwMFgpIGltcGxlbWVudHMgdGhlCj4+IGh5cGVydmlzb3Ig
ZXh0ZW5zaW9uIHlldCBoYXMgbm8gc2VudmNmZy4gS1ZNIHN3YXBzIHRoZSBDU1IKPj4gdW5jb25k
aXRpb25hbGx5IG9uIGV2ZXJ5IHZDUFUgZW50cnksIHBhbmljaW5nIHRoZSBob3N0IHVwb24gYSBn
dWVzdAo+PiBleGVjdXRpbmcgaXRzIGZpcnN0IGluc3RydWN0aW9uOgo+Pgo+PiAgIE9vcHMgLSBp
bGxlZ2FsIGluc3RydWN0aW9uIFsjMV0KPj4gICBNb2R1bGVzIGxpbmtlZCBpbjoga3ZtCj4+ICAg
Q1BVOiAyIFVJRDogMCBQSUQ6IDEyNyBDb21tOiBxZW11LXN5c3RlbS1yaXMgTm90IHRhaW50ZWQg
Ny4yLjAta3ZtNzNidWcrICM0IFBSRUVNUFRMQVpZCj4+ICAgSGFyZHdhcmUgbmFtZTogVW5rbm93
biBVbmtub3duIFByb2R1Y3QvVW5rbm93biBQcm9kdWN0LCBCSU9TIDIwMjQuMDEgMDEvMDEvMjAy
NAo+PiAgIGVwYyA6IGt2bV9yaXNjdl92Y3B1X2VudGVyX2V4aXQrMHgyNi8weGNmOCBba3ZtXQo+
PiAgICByYSA6IGt2bV9hcmNoX3ZjcHVfaW9jdGxfcnVuKzB4NGNlLzB4NWE2IFtrdm1dCj4+ICAg
c3RhdHVzOiAwMDAwMDAwMjAwMDAwMTAwIGJhZGFkZHI6IDAwMDAwMDAwMTBhNzk3ZjMgY2F1c2U6
IDAwMDAwMDAwMDAwMDAwMDIKPj4gICBbPGZmZmZmZmZmMDFkZjQzMmU+XSBrdm1fcmlzY3ZfdmNw
dV9lbnRlcl9leGl0KzB4MjYvMHhjZjggW2t2bV0KPj4gICBbPGZmZmZmZmZmMDFkZWIzYjA+XSBr
dm1fYXJjaF92Y3B1X2lvY3RsX3J1bisweDRjZS8weDVhNiBba3ZtXQo+PiAgIFs8ZmZmZmZmZmYw
MWRkNzkxND5dIGt2bV92Y3B1X2lvY3RsKzB4MTgwLzB4NWU0IFtrdm1dCj4+ICAgWzxmZmZmZmZm
ZjgwMjU3MDJlPl0gX19yaXNjdl9zeXNfaW9jdGwrMHg4NC8weDlhCj4+ICAgWzxmZmZmZmZmZjgw
ZGZkYzcyPl0gZG9fdHJhcF9lY2FsbF91KzB4MWQ4LzB4MzhhCj4+ICAgWzxmZmZmZmZmZjgwZTA4
NjQ0Pl0gaGFuZGxlX2V4Y2VwdGlvbisweDE2OC8weDE3NAo+PiAgIENvZGU6IDg0YWEgODkyZSBi
NzAzIDg4ODcgMTc3MyAxMDY3IDMwMjMgMTZlNSBiNzgzIDg5MDcgKDk3ZjMpIDEwYTcKPj4KPj4g
VG91Y2ggdGhlIENTUiBvbmx5IHdoZW4gUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcgaXMgc2V0
LCBzaW1pbGFyCj4+IHRvIF9fc3dpdGNoX3RvX2VudmNmZygpIGFzIHdlbGwgYXMgb3RoZXIgc3dh
cHMgY29uZGl0aW9uYWwgb24KPj4gdGhlaXIgZXh0ZW50aW9ucy4KPj4KPj4gRml4ZXM6IGRiM2Mw
MWM3YTMwOCAoIlJJU0NWOiBLVk06IEFkZCBzZW52Y2ZnIGNvbnRleHQgc2F2ZS9yZXN0b3JlIikK
Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWRsb2hyIEJ1ZXNvIDxkYXZlQHN0Z29sYWJzLm5ldD4KPiAK
PiBZb3VyIHBhdGNoIGlzIG9ubHkgY2hlY2tpbmcgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcg
d2hlbgo+IHNhdmluZy9yZXN0b3Jpbmcgc2VudmNmZyBidXQgbm90IGNoZWNraW5nIFJJU0NWX0lT
QV9FWFRfWExJTlVYRU5WQ0ZHCj4gd2hlbiBhY2Nlc3NpbmcgaGVudmNmZy4gVGhpcyB0ZWxscyBt
ZSB0aGF0IFA1MDAgc29tZWhvdyBtYW5hZ2VzIHRvCj4gaW1wbGVtZW50IGhlbnZjZmcgYnV0IGZv
cmdvdCB0byBpbXBsZW1lbnQgc2VudmNmZy4gQ2xlYXJseSwgY2hlY2tpbmcKPiBSSVNDVl9JU0Ff
RVhUX1hMSU5VWEVOVkNGRyBpcyBub3QgdGhlIHJpZ2h0IGFwcHJvYWNoLgoKQXMgdGhlIG90aGVy
IHJlcGxpZXMgaGF2ZSBtZW50aW9uZWQsIHRoaXMgZ2VuZXJhdGlvbiBvZiBQNTUwIGRvZXMgbm90
IGltcGxlbWVudApoZW52Y2ZnIGVpdGhlci4gSSBiZWxpZXZlIGNoZWNraW5nIFJJU0NWX0lTQV9F
WFRfWExJTlVYRU5WQ0ZHIHdvdWxkIGJlCnN1ZmZpY2llbnQgaGVyZS4gVGhlIG9ubHkgY29uY2Vy
biBpcyB0aGF0IHJpc2N2LGlzYS1leHRlbnNpb25zID0gImgiCnNwZWNpZmljYWxseSByZWZlcmVu
Y2VzIElTQSB2ZXJzaW9uIDIwMjExMjAzLCB3aGljaCBpbmNsdWRlcyBTczFwMTIsIHNvClJJU0NW
X0lTQV9FWFRfSCBzaG91bGQgaW1wbHkgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcuCgo+IElu
c3RlYWQsIEkgc3VnZ2VzdCBpbnRyb2R1Y2luZyBzdGF0aWMta2V5IGt2bV9yaXNjdl9ub19zZW52
Y2ZnIGFuZCBzZXQKPiBpdCBvbmx5IGZvciBQNTAwIChFU1dJTiBFSUM3NzAwWCkgaW4ga3ZtX3Jp
c2N2X3NldHVwX3ZlbmRvcl9mZWF0dXJlcygpLgo+IEFsc28sIGRvbid0IHNhdmUvcmVzdG9yZSBz
ZW52Y2ZnIENTUiBvbmx5IHdoZW4ga3ZtX3Jpc2N2X25vX3NlbnZjZmcgaXMKPiBzZXQuCgpPciBt
YXliZSB3ZSBzaG91bGQgYWRkIGEgbmV3IHJpc2N2LGlzYS1leHRlbnNpb25zID0gImgwcDYiIG9y
IHNpbWlsYXIuIFRoaXMKd291bGQgbm90IGltcGx5IFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZH
IGJ1dCB3b3VsZCBvdGhlcndpc2UgYmUgdGhlIHNhbWUgdGhlCnNhbWUgYXMgImgiLgoKUmVnYXJk
cywKU2FtdWVsCgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDYgKysrKy0tCj4+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5j
Cj4+IGluZGV4IGUwNjJjYTE5ZjlkOC4uMGMyZDU4ZGIxM2FiIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4+IEBAIC03
NzMsNyArNzczLDggQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGt2bV9yaXNjdl92Y3B1
X3N3YXBfaW5fZ3Vlc3Rfc3RhdGUoc3RydWN0IGt2bV92Y3B1ICoKPj4gICAgICAgICBzdHJ1Y3Qg
a3ZtX3ZjcHVfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9jc3I7Cj4+Cj4+ICAgICAgICAg
dmNwdS0+YXJjaC5ob3N0X3Njb3VudGVyZW4gPSBjc3Jfc3dhcChDU1JfU0NPVU5URVJFTiwgY3Ny
LT5zY291bnRlcmVuKTsKPj4gLSAgICAgICB2Y3B1LT5hcmNoLmhvc3Rfc2VudmNmZyA9IGNzcl9z
d2FwKENTUl9TRU5WQ0ZHLCBjc3ItPnNlbnZjZmcpOwo+PiArICAgICAgIGlmIChyaXNjdl9oYXNf
ZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHKSkKPj4gKyAgICAg
ICAgICAgICAgIHZjcHUtPmFyY2guaG9zdF9zZW52Y2ZnID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcs
IGNzci0+c2VudmNmZyk7Cj4+ICAgICAgICAgaWYgKHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtl
bHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKQo+PiAgICAgICAgICAgICAgICAgdmNwdS0+YXJj
aC5ob3N0X3NzdGF0ZWVuMCA9IGNzcl9zd2FwKENTUl9TU1RBVEVFTjAsIHNtY3NyLT5zc3RhdGVl
bjApOwo+PiAgICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lT
QV9FWFRfWklDRklTUykpCj4+IEBAIC03ODcsNyArNzg4LDggQEAgc3RhdGljIF9fYWx3YXlzX2lu
bGluZSB2b2lkIGt2bV9yaXNjdl92Y3B1X3N3YXBfaW5faG9zdF9zdGF0ZShzdHJ1Y3Qga3ZtX3Zj
cHUgKnYKPj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5n
dWVzdF9jc3I7Cj4+Cj4+ICAgICAgICAgY3NyLT5zY291bnRlcmVuID0gY3NyX3N3YXAoQ1NSX1ND
T1VOVEVSRU4sIHZjcHUtPmFyY2guaG9zdF9zY291bnRlcmVuKTsKPj4gLSAgICAgICBjc3ItPnNl
bnZjZmcgPSBjc3Jfc3dhcChDU1JfU0VOVkNGRywgdmNwdS0+YXJjaC5ob3N0X3NlbnZjZmcpOwo+
PiArICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRf
WExJTlVYRU5WQ0ZHKSkKPj4gKyAgICAgICAgICAgICAgIGNzci0+c2VudmNmZyA9IGNzcl9zd2Fw
KENTUl9TRU5WQ0ZHLCB2Y3B1LT5hcmNoLmhvc3Rfc2VudmNmZyk7Cj4+ICAgICAgICAgaWYgKHJp
c2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4pKQo+PiAg
ICAgICAgICAgICAgICAgc21jc3ItPnNzdGF0ZWVuMCA9IGNzcl9zd2FwKENTUl9TU1RBVEVFTjAs
IHZjcHUtPmFyY2guaG9zdF9zc3RhdGVlbjApOwo+PiAgICAgICAgIGlmIChyaXNjdl9oYXNfZXh0
ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfWklDRklTUykpCj4+IC0tCj4+IDIuMzkuNQo+
Pgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=

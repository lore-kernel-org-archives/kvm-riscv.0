Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26708C79FB6
	for <kvm-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coHnugj0f3LqJRdEbWjKg3pYEBuQ0/WPb0mP9wHkHfQ=; b=xt5CUrIsc10okE
	hDa6uXbtExtBzAUo+zfPea6UwPcJwfgkGEjAQKcX6IHH9UCjEcfM3gkGnuH4jdCr17X4JrABMUMKl
	PC/GCxwSgS2IpvYLU3iuPU5jzQa99XAtjud+1knoeSuwXPH1NdaT5h7XLWYGT8vZ0XC8flWhovPf+
	PQYXB8+qaED/SJQ5i2sDSRxB5Ua3vfLTRCMA8bEqnaCCrwYyxZTsXfRVbJJhnFpv7lM/fLHyCrSDR
	a4kOx+M+JjbpoSsMT4Vhjbzhjcf8KWHHp3mDG4Kl73LcEHeuxnqEjdf21CtOIuSX+ESi6dK/07UMK
	t6MD4nW72UugXybwX3Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1r-00000000e6i-3WYr;
	Sat, 12 Sep 2026 07:20:03 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5I1p-00000000e5Y-29Cs
	for kvm-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 07:20:02 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47de0093c42so1623008f8f.3
        for <kvm-riscv@lists.infradead.org>; Sat, 12 Sep 2026 00:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789197600; cv=none;
        d=google.com; s=arc-20260327;
        b=S653vIQOOGugve3pvsbU1EiU84NBg6H5n1pjb+o5Oranr64yfUM/g1+hbSx6lLZTAK
         pIT76m6oQpv5Qok0f8P96o/1a3wzYvKGq88mHLhfT9a1+XBVknpblmDPVMvQgZAjxfyS
         FpV3E5/MasSbvxUaERIRTVpzzppiUbJHv9qKZ85I0065pQVgfRGppSHibF3wRFL/8Tj7
         Pe+k5CkLTJeac1Pp3V7wQ7R9/L5+5806PQqlTRIxAePGRL8ebsvsSXQLGLyAxJzUvQl+
         2XAOYsa7GgqpCUfNWn1jYIkr/GeR+5V3x8lsNLmoaQcZSn8E7EOX0f4LmVkuGBzn0uty
         THpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        fh=7320S1OaUbWoZ5jEN+HXGIiik0I7mfqa8bWCswKT5xo=;
        b=IRSs12rwnp05hG70YMf6LF7yTtwihbJPO3Atx98Wm0eXZuTIsXD3At6MqiR+n1BY4Z
         nqAf3NQ51WMC3qQFFeeUexx5WGl9GvqmNWI9tvb1tjviu/IkmRC/qDDOy9/NIR1P9RXo
         FmG/mUGDK3MCDVZtSeivdDYJ4GHSOcq/NqR3aHn2aFo4qYfb8GRztZG6P8R/+T9sb7zM
         5HCGdcBbjXU9vrMdcJGcwkX2tnNEESCWhh1NzWZPq17PoLkDU1E3H0IxpRVE602zEYOJ
         l52Tf1G5nMILfzgKcHm14MCnLjkDUEoQ6E5bR2vIgqTxd0tVD8owowbugYKq/Vhgd5JS
         yeBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789197600; x=1789802400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        b=Hs5L+8j71IkqVLdsYRmoh9NJ1r5ufzcjZCNTt5ZTALYEi3xCD+2hNztDQIU0MIsPa7
         B66BOxiJbqC5JLKg3Rp3uEBdi6ZNxxXW7Ody5+K2Q839OUlnrf+eVXwJZ+1MhEpdYjoc
         c0fomntUTSK36WfxnQH3LPhbrfltk/7Fbspte0mEkhdvwEBVeOFYE6AOqhHNFh3dfXha
         uLOIsgkexFFqXwlfYDk7vwopjF8O1MTJXZtJXzi7DOh4VteFR/gDMyvl4fyyuBV+OAHA
         V7idic6yOHC7s92zDVJoHMI9GgQkSEYTkfCnuU1qrfsLGVT6Ej3JmOMdA5Al0ghOpwya
         sPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197600; x=1789802400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        b=FbeBqnB0o5Q31YHaDoW0iqXZFSVZ3MHf5wsmwp62aNnv/99xMCpr7p/sGFxHStFsbv
         osH0YC5fp4UOmEBJlT+XDpGVJSQB7TqsRjPZNS0XjQ51INsSfINBba6/v5QoNym9hzpg
         fngpPN7+sfQIK1BkNz1CMURhgHjTf2hia98yp+V7LmTnF+2AlCZK8U4lQMdLj6T9OI3s
         dcVigK4ice242LnWuEPO3OaNdV/FKf8PZo4TEsYFRnhiG7P7YsmXeQoUqfN2D8H7hFf4
         qWm0+KHUHC88+SUL0hJJUCUDynMtRQS8QMnGBxlpBTs/Sy3rX1Y9LYWXxioXCiBpWREL
         cEQg==
X-Forwarded-Encrypted: i=1; AKwUvBwUD8h2UIZpUS4ED7jdMriNAgFWLx+hKtgr4Ouo44yFfP6/70puvkPXnaGvrlRCM8aUiD1BOBwGd24=@lists.infradead.org
X-Gm-Message-State: AFuF++nbGc6Cfp8qXAHgtrZNtuIv/OvpoWMRAnW29zcNY0lajd5Q+Zyf
	zYqXkmKj9ymLSQLuyH1JWv125E/5NBJN50M5mU9xL5DfdExvQV10XDpNGAXmT+1h6wcsM3uqAFF
	J+F9iwMLCS8DWDFPGodtbkyHesYLiIRcw7KnU1GyqqiMurV3VkKQU9YE=
X-Gm-Gg: AYBFou0fgjMRUIl5RPTk1v69iRrgUDK4VfStePQzY4EabdXQueNPtMOsslRvL/rNawt
	cwCWHX2zWkCa+VJ1gAz5StOBk/YDBU8dMDeG09sAn0Emhyt5BZq00AWt8Cmgd7jt48G3tGgBaSK
	4FOIbkJsfcshHTHqLYvo/9gnBTnyY9y5nuqMqtQU3fZBSdwxRN9muvXUp6B1HV0xxliwRxUF7Zz
	f/udajLV1HwmtFRC9zraXA00kw/wcIPuo5sUiYe6jhpArQDH6p7mF2b60MHSWqtYFL+4Xrj+Z4o
	4ck7B0nrTGwppLWBiTOeo0l0fHCSr58fmt7F5i5WGBS1VmYg/f9eei6tzpZwJB6MEa7p3daZs2s
	BmpufAgbbiCfQ4pU05ek9PllMbBd/6DLXGV7xP2CnR1F82wnHfc1VeEvdjc9ezk7Pa2vUJXll/g
	==
X-Received: by 2002:a5d:5f44:0:b0:486:ed36:bb8 with SMTP id
 ffacd0b85a97d-486ed360ceemr8264961f8f.29.1789197599622; Sat, 12 Sep 2026
 00:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <caplitmus-rv.c91c005b844342d9a9f60949b04c520d.d65@163.com>
In-Reply-To: <caplitmus-rv.c91c005b844342d9a9f60949b04c520d.d65@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Sep 2026 12:49:47 +0530
X-Gm-Features: AcwNN1VonCRcgUOPNOO0ybAk3-QpJzTjEpr8-CCE2ai98LUN-VM9a568vF76B6w
Message-ID: <CAAhSdy0cnHwfs5hRfZdq6WAzrEobqcjYMuv1oAmvRk2pi2zkPA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Publish NACL HFENCE configuration last
To: Pengpeng Hou <hppiscas@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_002001_789279_8CCDD593 
X-CRM114-Status: GOOD (  15.39  )
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

T24gU3VuLCBTZXAgNiwgMjAyNiBhdCAxOjM34oCvUE0gUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0Ax
NjMuY29tPiB3cm90ZToKPgo+IFRoZSBTQkkgTkFDTCBpbnRlcmZhY2UgcmVxdWlyZXMgc29mdHdh
cmUgdG8gd3JpdGUgUGFnZV9OdW1iZXIgYW5kCj4gUGFnZV9Db3VudCBiZWZvcmUgcHVibGlzaGlu
ZyBhbiBIRkVOQ0UgZW50cnkgd2l0aCBDb25maWcuUGVuZGluZyBzZXQuCj4gX19rdm1fcmlzY3Zf
bmFjbF9oZmVuY2UoKSBjdXJyZW50bHkgc3RvcmVzIHRoZSBwZW5kaW5nIGNvbmZpZ3VyYXRpb24g
Zmlyc3QuCj4KPiBXcml0ZSB0aGUgcGF5bG9hZCBmaXJzdCBhbmQgb3JkZXIgdGhvc2Ugc3RvcmVz
IGJlZm9yZSBwdWJsaXNoaW5nIHRoZQo+IGNvbmZpZ3VyYXRpb24gd29yZCB3aXRoIFdSSVRFX09O
Q0UoKS4gVXNlIGEgd3JpdGUgYmFycmllciB0aGF0IGFsc28KPiBhcHBsaWVzIHRvIFVQIGtlcm5l
bHMsIHNpbmNlIHRoZSBjb25zdW1lciBpcyBvdXRzaWRlIHRoZSBMaW51eCBTTVAKPiBkb21haW4u
Cj4KPiBLZWVwIG5hY2xfaGZlbmNlX21rY29uZmlnKCkgdW5jaGFuZ2VkOiBzZXR0aW5nIFBlbmRp
bmcgaW4gYSBsb2NhbCB2YWx1ZQo+IGRvZXMgbm90IHB1Ymxpc2ggdGhlIGVudHJ5LiBUaGUgc2hh
cmVkLW1lbW9yeSBzdG9yZSBpcyB0aGUgcHVibGljYXRpb24KPiBwb2ludC4KPgo+IFRoZSBpc3N1
ZSB3YXMgZm91bmQgYnkgb3VyIHN0YXRpYy1hbmFseXNpcyB0b29sIGFuZCBtYW51YWxseSByZXZp
ZXdlZC4KPgo+IEZpeGVzOiBkNDY2YzE5Y2VhZDUgKCJSSVNDLVY6IEtWTTogQWRkIGNvbW1vbiBu
ZXN0ZWQgYWNjZWxlcmF0aW9uIHN1cHBvcnQiKQo+IEFzc2lzdGVkLWJ5OiBHUFQtNQo+IFNpZ25l
ZC1vZmYtYnk6IFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNAMTYzLmNvbT4KClRoZXJlIHdhcyBhbm90
aGVyIHBhdGNoIGZyb20gWm9uZ21pbiBaaG91IHdoaWNoIGlzIHJlbGF0aXZlbHkKbW9yZSBjb21w
bGV0ZSBoZW5jZSBJIGhhdmUgbWVyZ2VkIHRoYXQgb25lLgoKUmVnYXJkcywKQW51cAoKCj4gLS0t
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbmFjbC5jIGIvYXJjaC9yaXNjdi9rdm0v
bmFjbC5jCj4gaW5kZXggOWFmZjAzYzQuLmM1YzQ5MDdhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL25hY2wuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL25hY2wuYwo+IEBAIC01LDYgKzUs
NyBAQAo+Cj4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+ICAjaW5jbHVkZSA8bGludXgv
dm1hbGxvYy5oPgo+ICsjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4KPiAgI2luY2x1ZGUgPGFzbS9r
dm1fbmFjbC5oPgo+Cj4gIERFRklORV9TVEFUSUNfS0VZX0ZBTFNFKGt2bV9yaXNjdl9uYWNsX2F2
YWlsYWJsZSk7Cj4gQEAgLTQyLDEyICs0MywxNSBAQCBhZ2FpbjoKPiAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBlbnRwID0gc2htZW0gKyBTQklfTkFDTF9TSE1FTV9I
RkVOQ0VfRU5UUllfQ09ORklHKGkpOwo+IC0gICAgICAgKmVudHAgPSBjcHVfdG9fbGVsb25nKGNv
bnRyb2wpOwo+ICAgICAgICAgZW50cCA9IHNobWVtICsgU0JJX05BQ0xfU0hNRU1fSEZFTkNFX0VO
VFJZX1BOVU0oaSk7Cj4gICAgICAgICAqZW50cCA9IGNwdV90b19sZWxvbmcocGFnZV9udW0pOwo+
ICAgICAgICAgZW50cCA9IHNobWVtICsgU0JJX05BQ0xfU0hNRU1fSEZFTkNFX0VOVFJZX1BDT1VO
VChpKTsKPiAgICAgICAgICplbnRwID0gY3B1X3RvX2xlbG9uZyhwYWdlX2NvdW50KTsKPiArCj4g
KyAgICAgICAvKiBQdWJsaXNoIHRoZSBwYXlsb2FkIGJlZm9yZSBzZXR0aW5nIENvbmZpZy5QZW5k
aW5nLiAqLwo+ICsgICAgICAgd21iKCk7Cj4gKyAgICAgICBlbnRwID0gc2htZW0gKyBTQklfTkFD
TF9TSE1FTV9IRkVOQ0VfRU5UUllfQ09ORklHKGkpOwo+ICsgICAgICAgV1JJVEVfT05DRSgqZW50
cCwgY3B1X3RvX2xlbG9uZyhjb250cm9sKSk7Cj4gIH0KPgo+ICBpbnQga3ZtX3Jpc2N2X25hY2xf
ZW5hYmxlKHZvaWQpCj4KPiBiYXNlLWNvbW1pdDogNGQ3ZDk0ODZjMDRkOTE3MjY1ZjY0YzU1YmQy
M2IyY2M0ZmU3NzQ5Ywo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78985C43458
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 07:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5l6OxXTswsW+sOkPvi3QhWTte3Vw+eaFAvvqfcmK5H8=; b=q5TyKX3VpWb82h
	w7OFm8EPahZG/dapaNaKr5Rr1sZk5kppkexc+/DVjHtXEmLzhvmlfJ49i9q/M/diLSyEtS7PugGp5
	+o0vA6CFoSxfO0zFx0hSL4zbv/hHk1TnHEG1d6GhiILdiulVaiKl3PoL8Gg27epaZjIx/91AhKTpA
	ixTQCWFIrNR3vwik36ECmVFudl+S0hHoUL0f3e0O7YkD5AI2R2b4BIWlBKtwALzhVWBrzvVB0Brnc
	eNADQFTJNhR+70AbJm6dGvIijfdtXrV+3cc3V25RNsTikr4cN4ADFGWmjtJq2eZXjnY0hbyf0CxDx
	hWc/B/hdW4SzLRvtAi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0TW-0000000ELSY-34rI;
	Tue, 07 Jul 2026 07:44:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0TU-0000000ELRC-237A
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 07:44:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c59f740cso27135015e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 00:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783410251; cv=none;
        d=google.com; s=arc-20260327;
        b=YQyVHO70jtwBnbIgs5fzzmjHLP+CsY/QZNeSi7GRq7jA0RMvfOiWrMdKrfsT2wXqJo
         v7JZIB6I6b8Lc+zvVBN4OtOdbiw8UTA8GOmwQTMkRVfIdX/a3s1ka84vL5r5DCSvAu1S
         VU12GMYaY3Ey9U3bLRAkZH/6dHQdKeI52ajt80JnC88Dp5RTZCXBRbH4ofPBYSEOJ7ef
         q/8YnU//P7YMnmgnImdYmN14Fb72ocwag5Bdnye/dh+VRMpgclvSLIahH7yS44fOb2Jq
         iNCo38YuEVosE/5aqSJ5YnXlq5OCliC0MjSvup7+1Fx3BPco88tmucX+qXva0J1TnT+W
         bstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vv2Den0YhG1W1a/jXh+Ffx3hTXGA8/cBXV3TkYxGd2s=;
        fh=18ou+WEDkHjXsFUVat/U64TcDjmxRBMck3/CxYE+FKQ=;
        b=dTfblj6/4TlA9WaRDjHNgT+NCNz/m1mZmQ2V0Bb67TA/SD/RJNfiO/scYgZlt/MgnN
         K9IymMHFHJfCsa19kbJqSNiEAeTVB0CkSV7Q5GqYcy1f7xiqNfW1ZZUNQzoziX7VTlY1
         LZkWBRZwe3p7ZVoBMYodi6Xf1/5imphMq8eS3f7UG2XXS09ojGBQEH53x5DlAChuZmlI
         tEnK+REi5GW1bZYKhJeCECHQgH2UDewABnE3MnuWOzU6nlZFaP2jC3xo1fbGyuVTuewg
         nRcogtZAm2LfiIsSaVjS8PkeTJXS/Pb2h9sgIgABtf9f9FaPa3RGjnoo2qgoCE5ClEoI
         mRZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1783410251; x=1784015051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv2Den0YhG1W1a/jXh+Ffx3hTXGA8/cBXV3TkYxGd2s=;
        b=YwjcAGv0s4FV/CLiEtSDp3BDJUiDWIoqU99ktR8ZelNNeHr68VQtTP5GtfxU5iIOIN
         w/mxylhgYjLnRRPeH1lrJZcVyZEBkS8HfOW/EV4JDivuxdes8VzaIgBD9HLWPcXxe+u4
         aXoKrE50mPlixs6+d+NfTzFo3A3v9KJAPfU6eCEfKIv962xVP9fGGgplGi9sJZWCMF92
         sLE2r9a/8WnfgI2/NtjDzR/PvRaCYdadGD1RMnNVM+mBAcIm7xTOCXacbbqajcfpyL0w
         XOlutZvGsZDcgHfjf2P9bhAZ4TmipELHEWOc8pL87N8qBuz2HbExmHg4ntQd8K8EL8mE
         jxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410251; x=1784015051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vv2Den0YhG1W1a/jXh+Ffx3hTXGA8/cBXV3TkYxGd2s=;
        b=YS3J5P0Ch6gjs9+M35mS35S4Ww3YYS2Ffa6n/PsrvbL+HqI319vQaNp2yQa3e/fteQ
         0dji4gjb4JP6DmluwGPEBk9vUuTXpDXBa3k6tAKGeOfVzNoQXNR8/vkTKXyMvBA+t2xe
         Z4KnW33CEml62124gkGwAsf1XBKM3qoE6B6SFBjTCddxRydrPA5FEoyTjY5/qO5P5s8c
         t7ByYL7RWXq8v9z0pOqp52+ftHT/V/+ycsVeGVAYcqI0mXi47VjTXwJlhN0nuheqwpy+
         X/HvtpyjXqYWHrkH9+94bLMfkMI04J2ks6TDEDL8W+ksZeVm+m76qEdjpGj+oucIGHRA
         bxdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLd18YXTKTx0bh80GKqGtjVB6OEp3dgx9WrbhJ6il8QyV1ZMouwGznIVsYNiP/7QG+N+4bC0zexAY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3COJmSiEOis+jiIQ/Y6cvTNSUCb7/eWUethUQ9dQFlGE/0Qgm
	XPkQ4X3Kx3WAwegr952unMEjxAW76UsyqvzHa9FpY9PcvQqc6ez9WvW1dh21tTaLG+zxwj02qCd
	npOCne/TklJDCQj4W/kMxu5rUYcY+gzrhdDiG8tL2NQ==
X-Gm-Gg: AfdE7clVoTZOfmcWn3oYk4zpCqur0PudlcuGn/U+y1beLXMzW9u8gMhZPzkIpqQ32yo
	+Cw7oHDt8La8QwA0Az3L9Q9ta27ybWvqWpnAEmcm3mKMvz8+BakuQo8qxq56rkr4LkJek9eqb1N
	sG+dCVPjPjVKUjwIZBfxlZNs4Bg4T+CeU6T+W0knqIl/KnPciOLHraxvHE+I9JRZkqYihztoEn/
	aKkevKBRIw+sZM444UHvcwpIlvDASoHnjyZfmVCllFiJpkgz6Nj5XJEo7oSsQ7bSLTijYyjT5Io
	FdvOj5OpCf06RaI9bcq9hq2DurGKWtIBiFvDOJCWKAomBgGVTyspYfbibERiumdNVkIzr+heGYc
	tXIeDCSyFRxcvM3hoXMdGauOEQw==
X-Received: by 2002:a05:600c:3e19:b0:490:5057:f5f7 with SMTP id
 5b1f17b1804b1-493df08ba2dmr38413535e9.11.1783410250515; Tue, 07 Jul 2026
 00:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260706022046.214956-1-inochiama@gmail.com> <20260706022046.214956-2-inochiama@gmail.com>
 <akxm_sT7R9u4OIXo@inochi.infowork>
In-Reply-To: <akxm_sT7R9u4OIXo@inochi.infowork>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Jul 2026 13:13:58 +0530
X-Gm-Features: AVVi8CdAbCSVwzWnyKUTkhwaRsg0E1mft2P8fRkO5Uf7DAxOupq0MJNEfLWnnTo
Message-ID: <CAAhSdy3uPsYQUm5S+XHmAHunxB3M999GxNyM0Yj=9wakAVW=KA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] RISC-V: KVM: Add support for Svadu FWFT features
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Thomas Huth <thuth@redhat.com>, Deepak Gupta <debug@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004412_848157_0D5B5437 
X-CRM114-Status: GOOD (  33.21  )
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

T24gVHVlLCBKdWwgNywgMjAyNiBhdCA4OjE24oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAwNiwgMjAyNiBhdCAxMDoyMDozN0FN
ICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gSGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRF
IEEvRCBiaXRzIGlzIGNvbnRyb2xsZWQgdGhyb3VnaCBBRFVFIGJpdCBpbgo+ID4gaGVudmNmZyBF
eHBvc2UgdGhlIGZlYXR1cmUgb25seSBpZiBib3RoIFN2YWR1IGFuZCBTdmFkZSBhcmUgc3VwcG9y
dGVkCj4gPiBmb3IgVlMtbW9kZS4KPiA+Cj4gPiBBbGxvdyB0aGUgVk1NIHRvIGVuYWJsZS9kaXNh
YmxlIHRoaXMgZmVhdHVyZSBieSBjaGFuZ2UgdGhlIElTQQo+ID4gZXh0ZW5zaW9uIHN0YXRlIGlu
IHRoZSBndWVzdC4KPiA+Cj4gPiBBc3Npc3RlZC1ieTogWXVhblNoZW5nOmNsYXVkZS00Ljctb3B1
cwo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+
ID4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiA+IFNp
Z25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAgMSArCj4gPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jICAgIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+IGluZGV4IDUwNGU3MzMwNTM0My4uN2JiZWE4ODEy
ZDkyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+IEBAIC0yNDAsNiAr
MjQwLDcgQEAgc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdF9mZWF0dXJlIHsKPiA+ICBzdHJ1Y3Qg
a3ZtX3Jpc2N2X3NiaV9md2Z0IHsKPiA+ICAgICAgIHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2Z3ZnRf
ZmVhdHVyZSBtaXNhbGlnbmVkX2RlbGVnOwo+ID4gICAgICAgc3RydWN0IGt2bV9yaXNjdl9zYmlf
ZndmdF9mZWF0dXJlIHBvaW50ZXJfbWFza2luZzsKPiA+ICsgICAgIHN0cnVjdCBrdm1fcmlzY3Zf
c2JpX2Z3ZnRfZmVhdHVyZSBwdGVfYWRfaHdfdXBkYXRpbmc7Cj4gPiAgfTsKPiA+Cj4gPiAgLyog
SWYgeW91IG5lZWQgdG8gaW50ZXJwcmV0IHRoZSBpbmRleCB2YWx1ZXMsIGhlcmUgaXMgdGhlIGtl
eTogKi8KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiA+IGluZGV4IGFiMzlhYzQ2NGZmZC4uMDFk
YjQwYjUzMjk1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5j
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiA+IEBAIC0xMSw2ICsx
MSw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0Lmg+Cj4gPiAgI2luY2x1ZGUgPGFz
bS9jcHVmZWF0dXJlLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPiA+ICsjaW5jbHVkZSA8
YXNtL2t2bV9uYWNsLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9rdm1fdmNwdV9zYmkuaD4KPiA+ICAj
aW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+Cj4gPgo+ID4gQEAgLTk0LDYgKzk1LDQ1
IEBAIHN0YXRpYyBib29sIGt2bV9md2Z0X2lzX2RlZmluZWRfZmVhdHVyZShlbnVtIHNiaV9md2Z0
X2ZlYXR1cmVfdCBmZWF0dXJlKQo+ID4gICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gIH0KPiA+Cj4g
PiArc3RhdGljIHZvaWQga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1NjQgZmxhZykKPiA+ICt7Cj4gPiArICAgICB2Y3B1LT5hcmNoLmNmZy5oZW52Y2Zn
ICY9IH5mbGFnOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZW52
X2ZsYWdfc2V0X2hlbHBlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcg
KmNvbmYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9v
bCBvbmVfcmVnX2FjY2VzcywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCB1NjQgZmxhZykKPiA+ICt7Cj4gPiArICAgICBz
dHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnICpjZmcgPSAmdmNwdS0+YXJjaC5jZmc7Cj4gPiArCj4gPiAr
ICAgICBpZiAodmFsdWUgPT0gMCkKPiA+ICsgICAgICAgICAgICAgY2ZnLT5oZW52Y2ZnICY9IH5m
bGFnOwo+ID4gKyAgICAgZWxzZSBpZiAodmFsdWUgPT0gMSkKPiA+ICsgICAgICAgICAgICAgY2Zn
LT5oZW52Y2ZnIHw9IGZsYWc7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAgICAgICAgIHJldHVy
biBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4gPiArCj4gPiArICAgICBpZiAoIW9uZV9yZWdfYWNj
ZXNzKSB7Cj4gPiArICAgICAgICAgICAgIG5jc3Jfd3JpdGUoQ1NSX0hFTlZDRkcsIHZjcHUtPmFy
Y2guY2ZnLmhlbnZjZmcpOwo+ID4gKyAgICAgICAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdf
MzJCSVQpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG5jc3Jfd3JpdGUoQ1NSX0hFTlZDRkdI
LCB2Y3B1LT5hcmNoLmNmZy5oZW52Y2ZnID4+IDMyKTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsg
ICAgIHJldHVybiBTQklfU1VDQ0VTUzsKPiA+ICt9Cj4gPiArCj4KPiBIaSwgQW51cCwKPgo+IFRo
ZSBzYXNoaWtvIGJvdCBwb2ludCBvdXQgY2FsbGluZyBOQUNMIGhlbHBlciBpcyBub3Qgc2FmZSBo
ZXJlIGFzCj4gcHJlZW1wdGlvbiBpcyBub3QgYWxsb3dlZCB3aGVuIGNhbGxpbmcgdGhpc19jcHVf
cHRyKCkgYW5kIGl0IGlzCj4gdXNlZCBieSB0aGUgTkFDTCBoZWxwZXIuIFNpbmNlIEkgaGF2ZSBu
byBpZGVhIGFib3V0IGhvdyB0byBmaXggaXQsCj4gaXMgaXQgYWNjZXB0YWJsZSB0byB1c2UgY3Ny
IHJlYWQvd3JpdGUgZGlyZWN0bHkgaGVyZSBhcyBvdGhlciBGV0ZUCj4gZmVhdHVyZT8KCkkgdGhp
bmsgaXRzIG9rYXkgdXNlIHJlZ3VsYXIgY3NyX3JlYWQvd3JpdGUoKSBvdmVyIGhlcmUgYmVjYXVz
ZSBGV0ZUCmNhbGxzIGFyZSBub3QgaW4gaG90cGF0aCBzbyBpdCB3b24ndCBoYXZlIG11Y2ggaW1w
YWN0IG9uIG5lc3RlZAp2aXJ0dWFsaXphdGlvbiBwZXJmb3JtYW5jZS4KClJlZ2FyZHMsCkFudXAK
Cj4KPiBSZWdhcmRzLAo+IElub2NoaQo+Cj4KPiBUaGUgb3JpZ2luYWwgcmVwbHkgZnJvbSB0aGUg
Ym90IGlzCj4KPiBJcyBpdCBzYWZlIHRvIGNhbGwgbmNzcl93cml0ZSgpIGhlcmUgd2l0aG91dCBw
cmVlbXB0aW9uIGRpc2FibGVkPwo+Cj4gS1ZNIGhhbmRsZXMgU0JJIGVjYWxscyB3aXRoIHByZWVt
cHRpb24gZW5hYmxlZC4gVGhlIG5jc3Jfd3JpdGUoKSBtYWNybwo+IGV2YWx1YXRlcyBuYWNsX3No
bWVtKCksIHdoaWNoIHJlbGllcyBvbiB0aGlzX2NwdV9wdHIoKS4gVXNpbmcgdGhpc19jcHVfcHRy
KCkKPiB3aXRoIHByZWVtcHRpb24gZW5hYmxlZCB3aWxsIHRyaWdnZXIgYSBDT05GSUdfREVCVUdf
UFJFRU1QVCB3YXJuaW5nLgo+Cj4gQ291bGQgdGhlIHRocmVhZCBiZSBtaWdyYXRlZCB0byBhbm90
aGVyIENQVSBhZnRlciBjb21wdXRpbmcgdGhlIHBvaW50ZXIgYnV0Cj4gYmVmb3JlIHdyaXRpbmcg
dG8gaXQsIHJlc3VsdGluZyBpbiBwZXItQ1BVIG1lbW9yeSBjb3JydXB0aW9uIGJ5IHdyaXRpbmcg
dG8KPiB0aGUgTkFDTCBzaGFyZWQgbWVtb3J5IG9mIGFub3RoZXIgcGh5c2ljYWwgQ1BVPwo+Cj4g
QWRkaXRpb25hbGx5LCB3aGVuIE5BQ0wgaXMgZGlzYWJsZWQsIGl0IGZhbGxzIGJhY2sgdG8gY3Ny
X3dyaXRlKCksIHdoaWNoCj4gd3JpdGVzIGRpcmVjdGx5IHRvIHRoZSBwaHlzaWNhbCBDUFUncyBo
b3N0IENTUnMgKENTUl9IRU5WQ0ZHKS4gQ291bGQgdGhpcwo+IGxlYXZlIHRoZSBob3N0IHdpdGgg
bW9kaWZpZWQgaGFyZHdhcmUgc3RhdGUgaWYgdGhlIHZDUFUgdGhyZWFkIG1pZ3JhdGVzPwo+Cj4K
PiA+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZW52X2ZsYWdfZ2V0X2hlbHBlcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBvbmVfcmVnX2FjY2VzcywKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICp2
YWx1ZSwgdTY0IGZsYWcpCj4gPiArewo+ID4gKyAgICAgKnZhbHVlID0gKHZjcHUtPmFyY2guY2Zn
LmhlbnZjZmcgJiBmbGFnKSA9PSBmbGFnOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIFNCSV9TVUND
RVNTOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3ZnRfbWlzYWxpZ25l
ZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiAgewo+ID4g
ICAgICAgcmV0dXJuIG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKCk7Cj4gPiBAQCAtMTM3
LDYgKzE3NywzNCBAQCBzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVs
ZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiAgICAgICByZXR1cm4gU0JJX1NVQ0NF
U1M7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3ZnRfcHRlX2FkX2h3X3Vw
ZGF0aW5nX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiArewo+ID4gKyAgICAg
cmV0dXJuIHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTVkFE
VSkgJiYKPiA+ICsgICAgICAgICAgICAgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNw
dS0+YXJjaC5pc2EsIFNWQURFKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHZvaWQga3ZtX3Ni
aV9md2Z0X3Jlc2V0X3B0ZV9hZF9od191cGRhdGluZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4g
PiArewo+ID4gKyAgICAgaWYgKGt2bV9zYmlfZndmdF9wdGVfYWRfaHdfdXBkYXRpbmdfc3VwcG9y
dGVkKHZjcHUpKQo+ID4gKyAgICAgICAgICAgICBrdm1fc2JpX2Z3ZnRfZW52X2ZsYWdfcmVzZXRf
aGVscGVyKHZjcHUsIEVOVkNGR19BRFVFKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGxvbmcg
a3ZtX3NiaV9md2Z0X3NldF9wdGVfYWRfaHdfdXBkYXRpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgb25lX3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcg
dmFsdWUpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIGt2bV9zYmlfZndmdF9lbnZfZmxhZ19zZXRf
aGVscGVyKHZjcHUsIGNvbmYsIG9uZV9yZWdfYWNjZXNzLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbHVlLCBFTlZDRkdfQURVRSk7Cj4gPiArfQo+
ID4gKwo+ID4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9nZXRfcHRlX2FkX2h3X3VwZGF0aW5n
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG9uZV9yZWdf
YWNjZXNzLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKPiA+ICt7Cj4gPiArICAgICByZXR1cm4ga3Zt
X3NiaV9md2Z0X2Vudl9mbGFnX2dldF9oZWxwZXIodmNwdSwgY29uZiwgb25lX3JlZ19hY2Nlc3Ms
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWUs
IEVOVkNGR19BRFVFKTsKPiA+ICt9Cj4gPiArCj4gPiAgI2lmbmRlZiBDT05GSUdfMzJCSVQKPiA+
Cj4gPiAgc3RhdGljIGJvb2wgdHJ5X3RvX3NldF9wbW0odW5zaWduZWQgbG9uZyB2YWx1ZSkKPiA+
IEBAIC0yNDYsNiArMzE0LDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2Zl
YXR1cmUgZmVhdHVyZXNbXSA9IHsKPiA+ICAgICAgICAgICAgICAgLnNldCA9IGt2bV9zYmlfZndm
dF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ID4gICAgICAgICAgICAgICAuZ2V0ID0ga3Zt
X3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCj4gPiAgICAgICB9LAo+ID4gKyAg
ICAgewo+ID4gKyAgICAgICAgICAgICAuaWQgPSBTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcs
Cj4gPiArICAgICAgICAgICAgIC5maXJzdF9yZWdfbnVtID0gb2Zmc2V0b2Yoc3RydWN0IGt2bV9y
aXNjdl9zYmlfZndmdCwgcHRlX2FkX2h3X3VwZGF0aW5nLmVuYWJsZSkgLwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1bnNpZ25lZCBsb25nKSwKPiA+ICsgICAgICAg
ICAgICAgLnN1cHBvcnRlZCA9IGt2bV9zYmlfZndmdF9wdGVfYWRfaHdfdXBkYXRpbmdfc3VwcG9y
dGVkLAo+ID4gKyAgICAgICAgICAgICAucmVzZXQgPSBrdm1fc2JpX2Z3ZnRfcmVzZXRfcHRlX2Fk
X2h3X3VwZGF0aW5nLAo+ID4gKyAgICAgICAgICAgICAuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9w
dGVfYWRfaHdfdXBkYXRpbmcsCj4gPiArICAgICAgICAgICAgIC5nZXQgPSBrdm1fc2JpX2Z3ZnRf
Z2V0X3B0ZV9hZF9od191cGRhdGluZywKPiA+ICsgICAgIH0sCj4gPiAgI2lmbmRlZiBDT05GSUdf
MzJCSVQKPiA+ICAgICAgIHsKPiA+ICAgICAgICAgICAgICAgLmlkID0gU0JJX0ZXRlRfUE9JTlRF
Ul9NQVNLSU5HX1BNTEVOLAo+ID4gLS0KPiA+IDIuNTUuMAo+ID4KCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

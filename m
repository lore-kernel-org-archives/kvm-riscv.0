Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83474C43458
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X34eo6CUs3vcLjpgTRYaArvgWPQi1ghn/wmIMXmf1WM=; b=AY8XaiOpCJrFrc
	UBtFQq7Ve3vBZA5uvzyeYZET2D4iX1EJtoBjjIwoQKlgRvJPG85SK+Dr4oYXQFx30TTPQDqvhy/+1
	ru+VY/jjQNwsSIHeTMGX/xEMyde9bWJlOVZ8JUCpuOcIciXxgCZxPQp3w2pXxFkObF5nINx7+0cE6
	2BJSgcQuKxa09AOa7iN4iElKH5pUj2zviYZ5fVDhRbgS+wW5d5Tfq0Wj9+Ztn3iA2PahRfh+LAou5
	3ysm/O2vF2cwDWZSF1oZgSk6POFa7+RiUr7FaBcf/2VyVHq/sClE/jbPAVXrtSASkRvmrEuBqunPy
	+j0vbYd1l5ejX/0tS+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0bT-0000000ENNV-36Wo;
	Tue, 07 Jul 2026 07:52:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0bQ-0000000ENMK-3799
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 07:52:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cace7da66eso36688285ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410744; x=1784015544; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwFhZEe75QOrrpFepxS56/oDOfKBPpluDLwFIaqy6V8=;
        b=BeVSC2oPv08ifaz+1VavOWQRDA2+W89iBnR1s7kDOjHbHaznNSsLik+jBcHjXhQUPi
         Go0cONpDXV8vXaAGBJ1KsreYJN2zB5L4DWYoEuUcu0wyZ2SEuSC4Th8Ta9zP7tpRLNY/
         iVV0TrcbhgbrlpUB+G7EHKAEui7I8laf5adowkz3olex01uoW9jz3EPkRYP+4rdW+igR
         7HWGp2pPM+wBrCpx0mSiS+RvpHZ/Hnrp13mma2P4qkZRbWOkqhiFo49LCJRHjJOz9G1T
         iDu/HJKs8mIUSKMSkE8qzKey6X5amoDA2/Pe1GIyQYci2rHYLj13saGLBYK/5deh+Jba
         tplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410744; x=1784015544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GwFhZEe75QOrrpFepxS56/oDOfKBPpluDLwFIaqy6V8=;
        b=Ee/G30I8x3q5oYuCO+H9IFGtGP5Xi45naZFIy4S7MrrqNuCGC/1E5Cm5t7B5RZFQBS
         2VP7gTjAz8zH1VyPmdAKgoMriaCtnUock+ubdO2aJQLHtzO38G64rLdyWmOlPWeGLLdv
         pP6rn/rYLIsPULAtokoWr8ePU4iRQGCEVVEDd0ov6e6YNhKuqsLSksVy+/9rPNj3TN6J
         Pi2SvLmtGsjMIKA0xKTzEKG68Io5c7CddDhKF6/ouYnG7RzFoI+uUMoHzyOSDIL5vG1q
         f7YUM2685R1+HckCNFJyBaNDPkt1PkMYitNnoZHHkaKo5vSu4QUj463MepDAmoyul/VO
         geKw==
X-Forwarded-Encrypted: i=1; AHgh+RrbqPua0XrDeEaOIy6VXXEsI5z2V+xddqRL2QV3chs71IwKh04q0FaHz/hlEfSCGyM/zEMCAHGxd+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YynyEz1lkpF7imimkghcPxvwyHCarI1bAM659l38ezZroD3Xe0b
	yFqy+1vv3bVJ1UYUo2w+nLYfz0zY+8lVLTvO7tJZN8QXL9qmd5RD8bpH
X-Gm-Gg: AfdE7ck2Xr+9nqGNyeHF7igyUTfjbVgWp2Zzv/C0ctD51RwHXyVi4f6JTB9K3LkAXGO
	CNANb0GuKJo81lNPTOeLaTR7PfVdpPffzMrDq9xoyWaQ3KY91um5v1ctGkEwZYRkQ3rrBZ2hGZs
	kZ4iC5596BsY6lIygvxGXGxLw5S4yzmZjwhYzuDHjIHbnp30OZoH+6kuPGkDl8tIni3GwAp8WBk
	VPlS9naCrne6N+OM26Nmtw9JWro7mn8uZJfFkRTkqL8HxJM97OWpGrG72rIxy6x321HmHJzkRtw
	a9BMwE+snzm9wdn1cViTqKl0AlJayBP32tq9AhOs5VKgyvSyD/A3K4ZI2IvEmmQJ59fNdCU/SXM
	9+tjbZkZvNoD0UXOyxIkOtWYsTZlWXqlPJ/gXRTX5ImktgN/qX58nc6EJzfI0/UnHudrgq4Rhb7
	s=
X-Received: by 2002:a17:903:4b30:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2ccd6ded718mr1949235ad.7.1783410743761;
        Tue, 07 Jul 2026 00:52:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d45csm7010035ad.62.2026.07.07.00.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:52:23 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:51:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Deepak Gupta <debug@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v5 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Message-ID: <akyv9SQ3CIV1YF29@inochi.infowork>
References: <20260706022046.214956-1-inochiama@gmail.com>
 <20260706022046.214956-2-inochiama@gmail.com>
 <akxm_sT7R9u4OIXo@inochi.infowork>
 <CAAhSdy3uPsYQUm5S+XHmAHunxB3M999GxNyM0Yj=9wakAVW=KA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3uPsYQUm5S+XHmAHunxB3M999GxNyM0Yj=9wakAVW=KA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_005224_793622_CDCAB943 
X-CRM114-Status: GOOD (  37.96  )
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

T24gVHVlLCBKdWwgMDcsIDIwMjYgYXQgMDE6MTM6NThQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUdWUsIEp1bCA3LCAyMDI2IGF0IDg6MTbigK9BTSBJbm9jaGkgQW1hb3RvIDxpbm9j
aGlhbWFAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24sIEp1bCAwNiwgMjAyNiBhdCAx
MDoyMDozN0FNICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPiBIYXJkd2FyZSB1cGRh
dGluZyBvZiBQVEUgQS9EIGJpdHMgaXMgY29udHJvbGxlZCB0aHJvdWdoIEFEVUUgYml0IGluCj4g
PiA+IGhlbnZjZmcgRXhwb3NlIHRoZSBmZWF0dXJlIG9ubHkgaWYgYm90aCBTdmFkdSBhbmQgU3Zh
ZGUgYXJlIHN1cHBvcnRlZAo+ID4gPiBmb3IgVlMtbW9kZS4KPiA+ID4KPiA+ID4gQWxsb3cgdGhl
IFZNTSB0byBlbmFibGUvZGlzYWJsZSB0aGlzIGZlYXR1cmUgYnkgY2hhbmdlIHRoZSBJU0EKPiA+
ID4gZXh0ZW5zaW9uIHN0YXRlIGluIHRoZSBndWVzdC4KPiA+ID4KPiA+ID4gQXNzaXN0ZWQtYnk6
IFl1YW5TaGVuZzpjbGF1ZGUtNC43LW9wdXMKPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBRdWFuIFpo
b3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3Ug
PHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3Rv
IDxpbm9jaGlhbWFAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9rdm0uaCB8ICAxICsKPiA+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3
ZnQuYyAgICB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gPiA+IGluZGV4IDUwNGU3MzMwNTM0My4uN2JiZWE4ODEyZDkyIDEwMDY0NAo+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPiA+IEBAIC0yNDAsNiArMjQwLDcg
QEAgc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdF9mZWF0dXJlIHsKPiA+ID4gIHN0cnVjdCBrdm1f
cmlzY3Zfc2JpX2Z3ZnQgewo+ID4gPiAgICAgICBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0X2Zl
YXR1cmUgbWlzYWxpZ25lZF9kZWxlZzsKPiA+ID4gICAgICAgc3RydWN0IGt2bV9yaXNjdl9zYmlf
ZndmdF9mZWF0dXJlIHBvaW50ZXJfbWFza2luZzsKPiA+ID4gKyAgICAgc3RydWN0IGt2bV9yaXNj
dl9zYmlfZndmdF9mZWF0dXJlIHB0ZV9hZF9od191cGRhdGluZzsKPiA+ID4gIH07Cj4gPiA+Cj4g
PiA+ICAvKiBJZiB5b3UgbmVlZCB0byBpbnRlcnByZXQgdGhlIGluZGV4IHZhbHVlcywgaGVyZSBp
cyB0aGUga2V5OiAqLwo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
ZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gPiA+IGluZGV4IGFiMzlh
YzQ2NGZmZC4uMDFkYjQwYjUzMjk1IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9md2Z0LmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5j
Cj4gPiA+IEBAIC0xMSw2ICsxMSw3IEBACj4gPiA+ICAjaW5jbHVkZSA8bGludXgva3ZtX2hvc3Qu
aD4KPiA+ID4gICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVyZS5oPgo+ID4gPiAgI2luY2x1ZGUgPGFz
bS9zYmkuaD4KPiA+ID4gKyNpbmNsdWRlIDxhc20va3ZtX25hY2wuaD4KPiA+ID4gICNpbmNsdWRl
IDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9m
d2Z0Lmg+Cj4gPiA+Cj4gPiA+IEBAIC05NCw2ICs5NSw0NSBAQCBzdGF0aWMgYm9vbCBrdm1fZndm
dF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKPiA+
ID4gICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArc3RhdGljIHZvaWQg
a3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBm
bGFnKQo+ID4gPiArewo+ID4gPiArICAgICB2Y3B1LT5hcmNoLmNmZy5oZW52Y2ZnICY9IH5mbGFn
Owo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZW52X2Zs
YWdfc2V0X2hlbHBlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAq
Y29uZiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJv
b2wgb25lX3JlZ19hY2Nlc3MsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCB1NjQgZmxhZykKPiA+ID4gK3sKPiA+ID4g
KyAgICAgc3RydWN0IGt2bV92Y3B1X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+ID4g
PiArCj4gPiA+ICsgICAgIGlmICh2YWx1ZSA9PSAwKQo+ID4gPiArICAgICAgICAgICAgIGNmZy0+
aGVudmNmZyAmPSB+ZmxhZzsKPiA+ID4gKyAgICAgZWxzZSBpZiAodmFsdWUgPT0gMSkKPiA+ID4g
KyAgICAgICAgICAgICBjZmctPmhlbnZjZmcgfD0gZmxhZzsKPiA+ID4gKyAgICAgZWxzZQo+ID4g
PiArICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4gPiA+ICsKPiA+
ID4gKyAgICAgaWYgKCFvbmVfcmVnX2FjY2Vzcykgewo+ID4gPiArICAgICAgICAgICAgIG5jc3Jf
d3JpdGUoQ1NSX0hFTlZDRkcsIHZjcHUtPmFyY2guY2ZnLmhlbnZjZmcpOwo+ID4gPiArICAgICAg
ICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBuY3NyX3dyaXRlKENTUl9IRU5WQ0ZHSCwgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyA+
PiAzMik7Cj4gPiA+ICsgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICByZXR1cm4gU0JJX1NVQ0NF
U1M7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+Cj4gPiBIaSwgQW51cCwKPiA+Cj4gPiBUaGUgc2FzaGlr
byBib3QgcG9pbnQgb3V0IGNhbGxpbmcgTkFDTCBoZWxwZXIgaXMgbm90IHNhZmUgaGVyZSBhcwo+
ID4gcHJlZW1wdGlvbiBpcyBub3QgYWxsb3dlZCB3aGVuIGNhbGxpbmcgdGhpc19jcHVfcHRyKCkg
YW5kIGl0IGlzCj4gPiB1c2VkIGJ5IHRoZSBOQUNMIGhlbHBlci4gU2luY2UgSSBoYXZlIG5vIGlk
ZWEgYWJvdXQgaG93IHRvIGZpeCBpdCwKPiA+IGlzIGl0IGFjY2VwdGFibGUgdG8gdXNlIGNzciBy
ZWFkL3dyaXRlIGRpcmVjdGx5IGhlcmUgYXMgb3RoZXIgRldGVAo+ID4gZmVhdHVyZT8KPiAKPiBJ
IHRoaW5rIGl0cyBva2F5IHVzZSByZWd1bGFyIGNzcl9yZWFkL3dyaXRlKCkgb3ZlciBoZXJlIGJl
Y2F1c2UgRldGVAo+IGNhbGxzIGFyZSBub3QgaW4gaG90cGF0aCBzbyBpdCB3b24ndCBoYXZlIG11
Y2ggaW1wYWN0IG9uIG5lc3RlZAo+IHZpcnR1YWxpemF0aW9uIHBlcmZvcm1hbmNlLgo+IAoKR3Jl
YXQsIEkgd2lsbCBzd2l0Y2ggdG8gdGhlIGNzcl9yZWFkL3dyaXRlKCkgaW4gdGhlIG5leHQgdmVy
c2lvbi4gVGhhbmtzLgoKUmVnYXJkcywKSW5vY2hpCgo+IFJlZ2FyZHMsCj4gQW51cAo+IAo+ID4K
PiA+IFJlZ2FyZHMsCj4gPiBJbm9jaGkKPiA+Cj4gPgo+ID4gVGhlIG9yaWdpbmFsIHJlcGx5IGZy
b20gdGhlIGJvdCBpcwo+ID4KPiA+IElzIGl0IHNhZmUgdG8gY2FsbCBuY3NyX3dyaXRlKCkgaGVy
ZSB3aXRob3V0IHByZWVtcHRpb24gZGlzYWJsZWQ/Cj4gPgo+ID4gS1ZNIGhhbmRsZXMgU0JJIGVj
YWxscyB3aXRoIHByZWVtcHRpb24gZW5hYmxlZC4gVGhlIG5jc3Jfd3JpdGUoKSBtYWNybwo+ID4g
ZXZhbHVhdGVzIG5hY2xfc2htZW0oKSwgd2hpY2ggcmVsaWVzIG9uIHRoaXNfY3B1X3B0cigpLiBV
c2luZyB0aGlzX2NwdV9wdHIoKQo+ID4gd2l0aCBwcmVlbXB0aW9uIGVuYWJsZWQgd2lsbCB0cmln
Z2VyIGEgQ09ORklHX0RFQlVHX1BSRUVNUFQgd2FybmluZy4KPiA+Cj4gPiBDb3VsZCB0aGUgdGhy
ZWFkIGJlIG1pZ3JhdGVkIHRvIGFub3RoZXIgQ1BVIGFmdGVyIGNvbXB1dGluZyB0aGUgcG9pbnRl
ciBidXQKPiA+IGJlZm9yZSB3cml0aW5nIHRvIGl0LCByZXN1bHRpbmcgaW4gcGVyLUNQVSBtZW1v
cnkgY29ycnVwdGlvbiBieSB3cml0aW5nIHRvCj4gPiB0aGUgTkFDTCBzaGFyZWQgbWVtb3J5IG9m
IGFub3RoZXIgcGh5c2ljYWwgQ1BVPwo+ID4KPiA+IEFkZGl0aW9uYWxseSwgd2hlbiBOQUNMIGlz
IGRpc2FibGVkLCBpdCBmYWxscyBiYWNrIHRvIGNzcl93cml0ZSgpLCB3aGljaAo+ID4gd3JpdGVz
IGRpcmVjdGx5IHRvIHRoZSBwaHlzaWNhbCBDUFUncyBob3N0IENTUnMgKENTUl9IRU5WQ0ZHKS4g
Q291bGQgdGhpcwo+ID4gbGVhdmUgdGhlIGhvc3Qgd2l0aCBtb2RpZmllZCBoYXJkd2FyZSBzdGF0
ZSBpZiB0aGUgdkNQVSB0aHJlYWQgbWlncmF0ZXM/Cj4gPgo+ID4KPiA+ID4gK3N0YXRpYyBsb25n
IGt2bV9zYmlfZndmdF9lbnZfZmxhZ19nZXRfaGVscGVyKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBr
dm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYm9vbCBvbmVfcmVnX2FjY2VzcywKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnZhbHVlLCB1NjQg
ZmxhZykKPiA+ID4gK3sKPiA+ID4gKyAgICAgKnZhbHVlID0gKHZjcHUtPmFyY2guY2ZnLmhlbnZj
ZmcgJiBmbGFnKSA9PSBmbGFnOwo+ID4gPiArCj4gPiA+ICsgICAgIHJldHVybiBTQklfU1VDQ0VT
UzsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgc3RhdGljIGJvb2wga3ZtX3NiaV9md2Z0X21pc2Fs
aWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ID4gPiAg
ewo+ID4gPiAgICAgICByZXR1cm4gbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUoKTsKPiA+
ID4gQEAgLTEzNyw2ICsxNzcsMzQgQEAgc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X2dldF9taXNh
bGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ID4gPiAgICAgICByZXR1
cm4gU0JJX1NVQ0NFU1M7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgYm9vbCBrdm1fc2Jp
X2Z3ZnRfcHRlX2FkX2h3X3VwZGF0aW5nX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gPiA+ICt7Cj4gPiA+ICsgICAgIHJldHVybiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJs
ZSh2Y3B1LT5hcmNoLmlzYSwgU1ZBRFUpICYmCj4gPiA+ICsgICAgICAgICAgICAgcmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJjaC5pc2EsIFNWQURFKTsKPiA+ID4gK30KPiA+
ID4gKwo+ID4gPiArc3RhdGljIHZvaWQga3ZtX3NiaV9md2Z0X3Jlc2V0X3B0ZV9hZF9od191cGRh
dGluZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGlmIChrdm1f
c2JpX2Z3ZnRfcHRlX2FkX2h3X3VwZGF0aW5nX3N1cHBvcnRlZCh2Y3B1KSkKPiA+ID4gKyAgICAg
ICAgICAgICBrdm1fc2JpX2Z3ZnRfZW52X2ZsYWdfcmVzZXRfaGVscGVyKHZjcHUsIEVOVkNGR19B
RFVFKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3Nl
dF9wdGVfYWRfaHdfdXBkYXRpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndm
dF9jb25maWcgKmNvbmYsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIG9uZV9yZWdfYWNjZXNzLCB1bnNpZ25lZCBsb25nIHZhbHVlKQo+ID4g
PiArewo+ID4gPiArICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3NldF9oZWxwZXIo
dmNwdSwgY29uZiwgb25lX3JlZ19hY2Nlc3MsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2YWx1ZSwgRU5WQ0ZHX0FEVUUpOwo+ID4gPiArfQo+ID4g
PiArCj4gPiA+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZ2V0X3B0ZV9hZF9od191cGRhdGlu
ZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgb25l
X3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+ID4gPiArewo+ID4gPiArICAgICBy
ZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX2dldF9oZWxwZXIodmNwdSwgY29uZiwgb25lX3Jl
Z19hY2Nlc3MsCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2YWx1ZSwgRU5WQ0ZHX0FEVUUpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICAjaWZuZGVm
IENPTkZJR18zMkJJVAo+ID4gPgo+ID4gPiAgc3RhdGljIGJvb2wgdHJ5X3RvX3NldF9wbW0odW5z
aWduZWQgbG9uZyB2YWx1ZSkKPiA+ID4gQEAgLTI0Niw2ICszMTQsMTUgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSBmZWF0dXJlc1tdID0gewo+ID4gPiAgICAgICAg
ICAgICAgIC5zZXQgPSBrdm1fc2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPiA+
ID4gICAgICAgICAgICAgICAuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVn
YXRpb24sCj4gPiA+ICAgICAgIH0sCj4gPiA+ICsgICAgIHsKPiA+ID4gKyAgICAgICAgICAgICAu
aWQgPSBTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcsCj4gPiA+ICsgICAgICAgICAgICAgLmZp
cnN0X3JlZ19udW0gPSBvZmZzZXRvZihzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0LCBwdGVfYWRf
aHdfdXBkYXRpbmcuZW5hYmxlKSAvCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzaXplb2YodW5zaWduZWQgbG9uZyksCj4gPiA+ICsgICAgICAgICAgICAgLnN1cHBvcnRlZCA9
IGt2bV9zYmlfZndmdF9wdGVfYWRfaHdfdXBkYXRpbmdfc3VwcG9ydGVkLAo+ID4gPiArICAgICAg
ICAgICAgIC5yZXNldCA9IGt2bV9zYmlfZndmdF9yZXNldF9wdGVfYWRfaHdfdXBkYXRpbmcsCj4g
PiA+ICsgICAgICAgICAgICAgLnNldCA9IGt2bV9zYmlfZndmdF9zZXRfcHRlX2FkX2h3X3VwZGF0
aW5nLAo+ID4gPiArICAgICAgICAgICAgIC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X3B0ZV9hZF9o
d191cGRhdGluZywKPiA+ID4gKyAgICAgfSwKPiA+ID4gICNpZm5kZWYgQ09ORklHXzMyQklUCj4g
PiA+ICAgICAgIHsKPiA+ID4gICAgICAgICAgICAgICAuaWQgPSBTQklfRldGVF9QT0lOVEVSX01B
U0tJTkdfUE1MRU4sCj4gPiA+IC0tCj4gPiA+IDIuNTUuMAo+ID4gPgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK

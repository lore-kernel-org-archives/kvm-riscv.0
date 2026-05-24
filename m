Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168C7CD4F54
	for <kvm-riscv@archiver.kernel.org>; Sun, 24 May 2026 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aajOG47KbimyFAhY0QRLf647twa6wT5O+kswt3eMcC0=; b=UTkbe0taLDR8un
	VoaZwq4YrmMM00BtqvtMMd3+G2Z8+cCMQXCBnKKTUmv8Ic3EaDkWoJkyTCtC+geiG9NzaQLTKI9iF
	3R+SFEANnJwiZXcP8Y7YQP2Wv1m4HJqgrNssUsGZBSvBdRSiO50OOJxZZedJAL0c0ns0cV2hcCDCb
	8Ac/TglhbdrH6RBu1JrTCoxH2oB3tcfJ/wzNwYcU9AkfRQebpDnIdPKQDrvBoWoordT/CJ4MT2tuH
	edACoTxE6B39qGO7oICobkpmy3hzdfGv5mL/MO4CexKQ7qZkxdYnmyEjM1MPZl9Wm6HfWtcIOzTtr
	owq8MWsSuH4zjTF3cN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1KY-0000000EUTn-3TC4;
	Sun, 24 May 2026 05:24:54 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1KW-0000000EUSs-2zl3
	for kvm-riscv@lists.infradead.org;
	Sun, 24 May 2026 05:24:53 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-69d7b0be328so887117eaf.0
        for <kvm-riscv@lists.infradead.org>; Sat, 23 May 2026 22:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779600291; cv=none;
        d=google.com; s=arc-20240605;
        b=LXPtj+vuYp4dqaWfGxBropyTwpOph3LSHy9d66VZJ2rzDKZ29LqWh9Vu6eTeZtH8rs
         uRmDm/2q/8H06BCS0nir5kpss5FuEf3CmYvej+Wxyp78uY2k52kRvIBVcsar68SE9/Om
         6DGBrNabWYvqC1oRzz6c5+TM4U52J9xGsRL00VcUV5ewHql2KYrYbcGJg1q9U0e6+/z8
         Me3YKBqkfQuMFscAs+SpPgcATWxl+tTHfBYw3G1wIwmmXPMmkGaA/WUcKPozda7GjuGZ
         8OLR6KVrIedDbsRPsrCfCEuP5s20zAVgVuyoMokUX08Hh4+0AM9H295a7l1jG2JzqKyH
         DsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IbupSW0UagmshubFRiSQA618qybyRttziXYFiFa+ZEM=;
        fh=+Ztv6cTVpL4QbQrCkoQuP646uDWa+l/C+pEwyi83ZjQ=;
        b=bcusPt09TJ8ZbKyyDQhrP/Ci3aiwndIEl1UbwF4IVY4c7SU/IZslVcY9DWHHwcO4lu
         3KJFNbbkZvWi97x+sVNrmb78SVM5ZOXrEdZyaLNCKuoZwSqL+b1Nl8mLsq9Ah9cmvtPB
         Vhl9KUU/LTAtrY5dzClOG/z+64v5eZSP4+8oCTaJZ5oOGzsuQrmiBC7g99wwkPfKHUTT
         wGBjBuGt2L8RlaxJLDMjyayTZCBqWt+kA8MOhKQhoMdWbpNMV7XL6F9FVCMDyy95v1se
         nKywDXZjx3FKH8VLNM1E+bxLi5kqh+13LxYQLQvtp/ltE0AGwHua5iz4UfMSl57XDzFW
         trnA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779600291; x=1780205091; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbupSW0UagmshubFRiSQA618qybyRttziXYFiFa+ZEM=;
        b=ulbtWvB7WNcLJweoLV5lBrjy7cW+XFzJRufleiJ42aDJTk3f8FkuCacJY6ZpRYuMYd
         aQvbloBwnUoWCFa2yT9HOVqYhp5ejw3L7r/cVwAAkIzNyWizNVYyN4cC3KmxEBvCxDr5
         rXfDqbqELkOr6P9fXm5k797/J2tsBq90+i9V8R4QLYplcodgghhcGTBUgpHzbdmdWNQJ
         YBaLUrvItuoHYbNsFuBgBwFOLxaeHgnQsdmDJwR8BK2V8YhQEf/emmj4kkStt7h05Zgf
         48h0FI3ZvzLBx7LrlOc2Z4pQHFaECRiySgKkSjOMK0b9QZg65IDBSLmtLyf912KGXI/h
         YrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779600291; x=1780205091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IbupSW0UagmshubFRiSQA618qybyRttziXYFiFa+ZEM=;
        b=VE8rKVu3+FxRnt3Yif6tm3ZxHqNtdTixzC4jDTiYqp9jZ2d25jCy4bjUZWaSbFhti9
         5BQgky6CbTbWrHt1pPcXsbjlrpOPC/IKPZXWUPcttQhblnbtNbuVm2sQZkUYwIfMmB2i
         dtHRmgdCuuHj/REeUi6ztLv7qK8+GiC8yNallovUbWLO3Xps9Y9wh3E8h/y6t3Zfx7CS
         zSBWWhPBR0P1GfjR2QETHZpFudjCVmf5905+YwdHP09Y+Qo6sS4hR0Nslr43HqUyhgWM
         iUyASbVWCv5U9V/QNLyaMt5+7NnKdsoFlrPbykcvTX3GIyOhD+xKJ2khPTVnAeolU2g1
         Hjbg==
X-Forwarded-Encrypted: i=1; AFNElJ8krwTrAQkfghnLYXvQNGs9ICEO0+bDDRGA6b7XLdu6HVLAaFSdv/Sg9xqrDA0wktEFlX5dn8HjQW8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4/FIY3Ih4f8CFuzGeKsNNhn3qOCyDrh6qxUYhK1QyEW2FHKJy
	4HGZOMd03kMGdjdaHTxs4GYz/eqxz3W25ZbKguyx4dsalT6xBF71gEujn3Plmsv8qSz6UhLl3Dw
	GBC2r5QVlkDKS1Fgtl5SAvHduL3rm76mX3G1nWP6Vdg==
X-Gm-Gg: Acq92OEEylJ6wdJrZAOgk+e6rFFqYfzwPBCb2vq9378a8EqzQSFTZCWVfWiNyy9PaWS
	sTYpFcvohpYn7VkmFtlnQHTqWq6LX98/DAjx9T6rFWhrL1OeA/WLfspebtc2lmcCMOCPHLeA1uB
	LR/8EggETbLSc2XG48hpbM7G0a7j19Shnn4nkDR7WKkkQCsrKhbdMQVfZ0r+lTnvtYRw6PjHX7M
	Kvdq/Dh4WAJSP/NwXzBlV4XqOmEqOgjFKvZ45pZ++vnGlXPU/KPa6omEZ9z9KQlfhAnTHHeHlXh
	l8ijXK9v7RZN5R32NEky06VCAFpIkUS92aZUxrIJDnNsxosnaHAAN+KapZf/eDimEpL4ukzPN6M
	PtJJGZV4jqT/Qtn8a9WFc/HKjO1wM5PwfyKL7kA==
X-Received: by 2002:a05:6820:868b:b0:69b:5f97:de79 with SMTP id
 006d021491bc7-69d7eb91b64mr4064097eaf.19.1779600291542; Sat, 23 May 2026
 22:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org> <20260425005916.3321811-3-guoren@kernel.org>
In-Reply-To: <20260425005916.3321811-3-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 May 2026 10:54:39 +0530
X-Gm-Features: AVHnY4KihubV0U34tSm4W-TTo3A-ChHfjM74JnkAvA8gb0S55cVQRZv-mcQkpfE
Message-ID: <CAAhSdy1pDsRZGorxU9bJ7cs19v3LH40hhoaYvWQUsFo-z_Fjmw@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] RISC-V: KVM: AIA: Replace global HGEI count with
 simple enabled bool
To: guoren@kernel.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, gaohan@iscas.ac.cn, 
	inochiama@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, me@ziyao.cc, 
	palmer@dabbelt.com, pjw@kernel.org, tglx@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_222452_765576_E9F52EDB 
X-CRM114-Status: GOOD (  22.03  )
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

T24gU2F0LCBBcHIgMjUsIDIwMjYgYXQgNjoyOeKAr0FNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBOb3cgdGhhdCBIR0VJIGxpbmUgbWFuYWdlbWVudCBpcyBmdWxseSBwZXIt
Q1BVICh2aWEgc3RydWN0Cj4gYWlhX2hnZWlfY29udHJvbDo6bnJfaGdlaSksIHRoZSBnbG9iYWwg
YGt2bV9yaXNjdl9haWFfbnJfaGdlaWAKPiBpcyBubyBsb25nZXIgbmVlZGVkLiBSZXBsYWNlIGl0
IHdpdGggYSBzaW1wbGUgYGJvb2wKPiBrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZGAgdGhhdCBv
bmx5IGluZGljYXRlcyB3aGV0aGVyIEhHRUkKPiBzdXBwb3J0IGlzIGF2YWlsYWJsZSBhdCBhbGwu
CgpBcyBtZW50aW9uZWQgaW4gUEFUQ0gxLCB0aGlzIFBBVENIIGlzIG5vdCByZXF1aXJlZC4KCj4K
PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBr
ZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaCB8ICAy
ICstCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgIHwgMTggKysrKysrKystLS0t
LS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyAgICAgIHwgIDQgKystLQo+ICBh
cmNoL3Jpc2N2L2t2bS9tYWluLmMgICAgICAgICAgICB8ICAzICstLQo+ICA0IGZpbGVzIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fYWlhLmgKPiBpbmRleCBiMDRlY2RkMWE4NjAuLmU4NzQ5YWM2YmVkNyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX2FpYS5oCj4gQEAgLTc5LDcgKzc5LDcgQEAgc3RydWN0IGt2bV92Y3B1X2Fp
YSB7Cj4KPiAgI2RlZmluZSBpcnFjaGlwX2luX2tlcm5lbChrKSAgICAgICAgICAgKChrKS0+YXJj
aC5haWEuaW5fa2VybmVsKQo+Cj4gLWV4dGVybiB1bnNpZ25lZCBpbnQga3ZtX3Jpc2N2X2FpYV9u
cl9oZ2VpOwo+ICtleHRlcm4gYm9vbCBrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZDsKPiAgZXh0
ZXJuIHVuc2lnbmVkIGludCBrdm1fcmlzY3ZfYWlhX21heF9pZHM7Cj4gIERFQ0xBUkVfU1RBVElD
X0tFWV9GQUxTRShrdm1fcmlzY3ZfYWlhX2F2YWlsYWJsZSk7Cj4gICNkZWZpbmUga3ZtX3Jpc2N2
X2FpYV9hdmFpbGFibGUoKSBcCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jIGIv
YXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBpbmRleCBhMjM3MjkwNTJjZmIuLjcwZmYxZDI1ZGQ5OSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYS5jCj4gQEAgLTI4LDcgKzI4LDcgQEAgc3RydWN0IGFpYV9oZ2VpX2NvbnRyb2wgewo+ICBz
dGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IGFpYV9oZ2VpX2NvbnRyb2wsIGFpYV9oZ2VpKTsK
PiAgc3RhdGljIGludCBoZ2VpX3BhcmVudF9pcnE7Cj4KPiAtdW5zaWduZWQgaW50IGt2bV9yaXNj
dl9haWFfbnJfaGdlaTsKPiArYm9vbCBrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZDsKPiAgdW5z
aWduZWQgaW50IGt2bV9yaXNjdl9haWFfbWF4X2lkczsKPiAgREVGSU5FX1NUQVRJQ19LRVlfRkFM
U0Uoa3ZtX3Jpc2N2X2FpYV9hdmFpbGFibGUpOwo+Cj4gQEAgLTQ5MSw3ICs0OTEsNyBAQCBzdGF0
aWMgaW50IGFpYV9oZ2VpX2luaXQodm9pZCkKPiAgICAgICAgIHN0cnVjdCBpcnFfZG9tYWluICpk
b21haW47Cj4KPiAgICAgICAgIC8qIFNraXAgU0dFSSBpbnRlcnJ1cHQgc2V0dXAgZm9yIHplcm8g
Z3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0cyAqLwo+IC0gICAgICAgaWYgKCFrdm1fcmlzY3ZfYWlh
X25yX2hnZWkpCj4gKyAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfaGdlaV9lbmFibGVkKQo+ICAg
ICAgICAgICAgICAgICBnb3RvIHNraXBfc2dlaV9pbnRlcnJ1cHQ7Cj4KPiAgICAgICAgIC8qIEZp
bmQgSU5UQyBpcnEgZG9tYWluICovCj4gQEAgLTUyNCw3ICs1MjQsNyBAQCBzdGF0aWMgaW50IGFp
YV9oZ2VpX2luaXQodm9pZCkKPiAgc3RhdGljIHZvaWQgYWlhX2hnZWlfZXhpdCh2b2lkKQo+ICB7
Cj4gICAgICAgICAvKiBEbyBub3RoaW5nIGZvciB6ZXJvIGd1ZXN0IGV4dGVybmFsIGludGVycnVw
dHMgKi8KPiAtICAgICAgIGlmICgha3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpKQo+ICsgICAgICAgaWYg
KCFrdm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+
Cj4gICAgICAgICAvKiBGcmVlIHBlci1DUFUgU0dFSSBpbnRlcnJ1cHQgKi8KPiBAQCAtNjMxLDYg
KzYzMSw3IEBAIGludCBrdm1fcmlzY3ZfYWlhX2luaXQodm9pZCkKPiAgewo+ICAgICAgICAgaW50
IHJjOwo+ICAgICAgICAgY29uc3Qgc3RydWN0IGltc2ljX2dsb2JhbF9jb25maWcgKmdjOwo+ICsg
ICAgICAgdW5zaWduZWQgaW50IGt2bV9yaXNjdl9haWFfbnJfaGdlaTsKPgo+ICAgICAgICAgaWYg
KCFyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBTeEFJQSkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PREVWOwo+IEBAIC02NDEsMjEgKzY0MiwxOCBAQCBpbnQga3ZtX3Jp
c2N2X2FpYV9pbml0KHZvaWQpCj4gICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkgPSBmbHNf
bG9uZyhjc3JfcmVhZChDU1JfSEdFSUUpKTsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfSEdFSUUs
IDApOwo+ICAgICAgICAgaWYgKGt2bV9yaXNjdl9haWFfbnJfaGdlaSkKPiAtICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpLS07Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9h
aWFfaGdlaV9lbmFibGVkID0gdHJ1ZTsKPgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIE51bWJl
ciBvZiB1c2FibGUgSEdFSSBsaW5lcyBzaG91bGQgYmUgbWluaW11bSBvZiBwZXItSEFSVAo+ICAg
ICAgICAgICogSU1TSUMgZ3Vlc3QgZmlsZXMgYW5kIG51bWJlciBvZiBiaXRzIGluIEhHRUlFCj4g
ICAgICAgICAgKi8KPiAtICAgICAgIGlmIChnYykKPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X2FpYV9ucl9oZ2VpID0gbWluKCh1bG9uZylrdm1fcmlzY3ZfYWlhX25yX2hnZWksCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnYy0+bnJfZ3Vlc3RfZmlsZXMp
Owo+IC0gICAgICAgZWxzZQo+IC0gICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkg
PSAwOwo+ICsgICAgICAgaWYgKCFnYykKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9o
Z2VpX2VuYWJsZWQgPSAwOwo+Cj4gICAgICAgICAvKiBGaW5kIG51bWJlciBvZiBndWVzdCBNU0kg
SURzICovCj4gICAgICAgICBrdm1fcmlzY3ZfYWlhX21heF9pZHMgPSBJTVNJQ19NQVhfSUQ7Cj4g
LSAgICAgICBpZiAoZ2MgJiYga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpKQo+ICsgICAgICAgaWYgKGdj
ICYmIGt2bV9yaXNjdl9haWFfaGdlaV9lbmFibGVkKQo+ICAgICAgICAgICAgICAgICBrdm1fcmlz
Y3ZfYWlhX21heF9pZHMgPSBnYy0+bnJfZ3Vlc3RfaWRzICsgMTsKPgo+ICAgICAgICAgLyogSW5p
dGlhbGl6ZSBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHQgbGluZSBtYW5hZ2VtZW50ICovCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYwo+IGluZGV4IDNkMWU4MWUyYTM2Yi4uNWI0NWIxMTE0NDI1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYwo+IEBAIC03MSw3ICs3MSw3IEBAIHN0YXRpYyBpbnQgYWlhX2NvbmZpZyhzdHJ1
Y3Qga3ZtICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAqIGV4dGVybmFsIGludGVycnVwdHMgKGkuZS4gbm9uLXplcm8KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAqIFZTLWxldmVsIElNU0lDIHBhZ2VzKS4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCFrdm1fcmlzY3ZfYWlhX25yX2hnZWkpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfaGdlaV9lbmFibGVkKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGRlZmF1bHQ6Cj4gQEAgLTYyOCw3ICs2MjgsNyBAQCB2b2lkIGt2bV9yaXNjdl9haWFfaW5pdF92
bShzdHJ1Y3Qga3ZtICprdm0pCj4gICAgICAgICAgKi8KPgo+ICAgICAgICAgLyogSW5pdGlhbGl6
ZSBkZWZhdWx0IHZhbHVlcyBpbiBBSUEgZ2xvYmFsIGNvbnRleHQgKi8KPiAtICAgICAgIGFpYS0+
bW9kZSA9IChrdm1fcmlzY3ZfYWlhX25yX2hnZWkpID8KPiArICAgICAgIGFpYS0+bW9kZSA9IChr
dm1fcmlzY3ZfYWlhX2hnZWlfZW5hYmxlZCkgPwo+ICAgICAgICAgICAgICAgICBLVk1fREVWX1JJ
U0NWX0FJQV9NT0RFX0FVVE8gOiBLVk1fREVWX1JJU0NWX0FJQV9NT0RFX0VNVUw7Cj4gICAgICAg
ICBhaWEtPm5yX2lkcyA9IGt2bV9yaXNjdl9haWFfbWF4X2lkcyAtIDE7Cj4gICAgICAgICBhaWEt
Pm5yX3NvdXJjZXMgPSAwOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMgYi9h
cmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBpbmRleCBjYjhhNjUyNzNjMWYuLmJjZmExMzlmNDg3MSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS9tYWluLmMKPiBAQCAtMTY5LDggKzE2OSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2t2
bV9pbml0KHZvaWQpCj4gICAgICAgICBrdm1faW5mbygiVk1JRCAlbGQgYml0cyBhdmFpbGFibGVc
biIsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9iaXRzKCkpOwo+Cj4gICAgICAgICBpZiAoa3ZtX3Jp
c2N2X2FpYV9hdmFpbGFibGUoKSkKPiAtICAgICAgICAgICAgICAga3ZtX2luZm8oIkFJQSBhdmFp
bGFibGUgd2l0aCAlZCBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHRzXG4iLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkpOwo+ICsgICAgICAgICAgICAgICBr
dm1faW5mbygiQUlBIGF2YWlsYWJsZSB3aXRoIGd1ZXN0IGV4dGVybmFsIGludGVycnVwdHNcbiIp
Owo+Cj4gICAgICAgICBrdm1fcmlzY3Zfc2V0dXBfdmVuZG9yX2ZlYXR1cmVzKCk7Cj4KPiAtLQo+
IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A4B10F6FD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 16:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vZOYaRREeu9iPEXV2NggdUIVLuJoLWw+cYgHhef9WI=; b=OmYrk3p8mNXzaS
	5jBknUbWjCgSwti92yIsIWsI7qIIRR9SbdpnmZlCYdtENmMon1JEHkNoRsQtXGGW+oRBWLS8hnro1
	ORtysi8tqmR0ZlA3yYwGNq3vqU9qrWU4XayD27j+CFn8JqFwKbXusvCpP3E9FfCIYJxgdTzvXDo4R
	EKSKH0TMaqro5EUSbvEYNFgWFs4bWjtd7cejnSvqFGLEGTzXjB6tZfn5/04dtgx/3ZVHc7e4zV4fv
	Tzj0zwbKQvPUM160HpG9sMbGoFkyRQ7ZUXYBbXYRRdzKkQOOT1wp/jSF4Ji5WPJ3yZK9xBkTLNtjh
	EYWKvARuRLr/nVB31DcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7y50-0000000FhF4-1MZV;
	Wed, 01 Apr 2026 16:06:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7y4z-0000000FhEc-0i5N
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Apr 2026 16:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2K4NyhHCMd8zoqLYq9nB5V2Ysiwf1MV0VYCls+gbenU=; b=aRxszeGb76FmazzQ2sQqY03Jvv
	V+tNJ/BnEuYTb+0lAmmfNKmMxIYv3B2tud7KuQpALFq51vdnqFEb/V32DeEwCR0mq5eP+VUKqDVN0
	olLeY9AfJIIB+2SZlrThT5wNiCbP/zpUkRTd+qutMVlOt44LhTAFKAwxE78Z4MuHz0ns9Fz38A827
	qGdtLlnVAXLsXW7QI9ujVlCTKYiwU31kNioq8LMlD07BViVIWIdExaDHQwQ+kjQdRWFQDIvfRWlnk
	OU5Tmg64WnkWguj31giH/L+7PUF+yNMfytqscZ1e3SgmNqUU3RLJ3w4/cWRhXwNcburl8eLuYG+r6
	8Mak0bIQ==;
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7y4w-00000000qsG-0Zfg
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 16:06:03 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-673ee2a98b1so3713179eaf.0
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Apr 2026 09:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775059560; cv=none;
        d=google.com; s=arc-20240605;
        b=jYzRl8Pa/7n03kq0G6GjRjor5h+tDxHAR6S9XNtz1hcQo8SDKT40hFxzfBlO3e4fsg
         jemMmvJATQAPQQ3aE1dQwvLX5Z9RaAB7ut9mI5rxdSL0TTBAAo5ylkP+txsxpsD7DXjJ
         eaEwuxSNdtec9GWQMyC1Vq21L2fDog0JAN5VwC+S6iRzdHu5LtBzRf+U0JAjGO4hVq2q
         oZeuIQo9+24ytg1BaMJQOYBNF4TFmjdJBgwxiVEH8jacQzukh6paXymrkFuHxRLvFh7w
         zyhYOJ1J/22vSJzQqF+uwBzkYKc+B6NyvaZOLns8JV6nnv/5Z6m3BDkMPCujP0WNXBrt
         zbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2K4NyhHCMd8zoqLYq9nB5V2Ysiwf1MV0VYCls+gbenU=;
        fh=OAlvWAeS+TbX0cStScE3hKbN4TysmLGDsSDKOs4UKCE=;
        b=DDDaB0UP/yhF9D1OlEwyM/XlJ65nhHGnwuXf+mNx66ou1A0smOXLqacPEI/7NBhzkf
         JSHytBZWgfx1RfW11EbyssgLIJPOy8sc1UPtHOXsqOb/MaXfHAIvAlXPlRyQQo6RZNzN
         H4D/R8xGU4vmmvBWz4gr5wYNv28sXgtMi7xZKs95hcfLaZpm8iUjrQ4zH9xYcoUObkZx
         6je/1hbCgNbxJerpCsBVQQS/teTWbItL0TyE7Dcanmo6LC3NNIL1X0Wgt7JGTyxK5vNu
         D0Ps3e32jBxGwbuoRCEw8NCElIztZsP81TnwTad5wRegdm6b4GXuJU2RKZUfI23dPo91
         uX8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775059560; x=1775664360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K4NyhHCMd8zoqLYq9nB5V2Ysiwf1MV0VYCls+gbenU=;
        b=mqVRkkeFWa10YYpU12GnmkScmzNf6v2SfnC3ta2vKqoxnt+glceckmHFIrG2/VhQTA
         puYfoXY4vHNID05xeFJml1uQrdhXbz1POk5ZLMFMP4UWWpF7QDdjfmq0YiuW8Fpu3cDs
         b3+G1h4e27JkmF1IcjhgLzryEedd2K3al89h/2e8bjNC+QNaJhVGTPU/YAS4Q897ZwRs
         aImnnn0wvwH4HXgnfZXjW9BgZbpu6oqERtJtYXEjyG/ty0sNaje3dfN6C4XGNVKuP80h
         EX++ROk6FBN5aDyonH9nRC60Ys1yQa+9S22qEhh9IPc7yj5xuUbDnBFUehDYgUrnWD8p
         gWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059560; x=1775664360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2K4NyhHCMd8zoqLYq9nB5V2Ysiwf1MV0VYCls+gbenU=;
        b=LoqSwHaxEvEdTh2WT/4sxSJ7O56GMReOXeuIG828nEy36Hq45DAOzgdSC7nP6CbOzf
         6Mft2vl4nY/1z4ZMu8yeHGvINeJiZdb2yFuu4XR62szCv5/1cP8Z9jndoj93HxPhVGZ4
         gzV/kK+wFS4C+ZZxjuFGaUy6O+cqJLQiKYccyXBbnYK+GsbOoYaU1ayn2s/81oRuU4ar
         DUQ4q0jSXTQxZ0pfwnV09AnjJ7z37IL27ajTKudO3cj7Uwg2ft8oui2oFBdgfAwYDElR
         MVdxNJwygUau6Vaw21BrpjsaqJRPAoRqgbRC5O92+BxhaFmuyRpUwKKseKiw1PnijB/s
         BMKw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJFh5AKW21yz3acJKKwV3xHuuMBgruPl0x4pSsrcY7titR7CnamA+wnnbD73H1I0uYjuQC0EhD4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAEsk4ApENyg4L9BfkVd5NGzDoY4uTGJTgy+vbHYOKhcgdoGjU
	aOeX1mvc74rAbga0T4R/RpE++oSeCwvsOzzNqrCGYlpXw1d2qChuEGdMQgh87B4Np/b4lw7WO4M
	XwOkfMPZY4ippX/5aQh0euyQX9YjYzW1ASAHZEHC7xg==
X-Gm-Gg: ATEYQzxWvU2uBp5qTozv97oR68Z8b6Yw6luVLI0X7q0k5HYvEO/EO3UREl1LmBkh1RU
	S8UPO0uxX7dY+LCaLqCR/VJwxTnLBVSfm9hmvnT+uz06BICxkipk6kh5JXIrX5ZXW1eN1baqip+
	Itmewc/yWZw0Lu/Tix8cWFDvbCWyoskrRvXQtjYD54mbI9uH4lwkzuvMzLk/ZORVwRV9kzmPPZk
	u6A2H8M4vkRh7scIj4XYM0AfJ31T6Jj4qRye4GBuOQkQlRfxJb8bj2lehDrhfWJcKYDreVQ1USM
	SbarAUCQ8X769UxU6v+vkSRyNP1zkO9hgjJmyfGQRr6NeLhMgpI2mrsQafSH/u0JFwqnln/2pUa
	0KO92KkrNNcdSyYHEmJJ0SOX9dw==
X-Received: by 2002:a05:6820:20e:b0:67e:160c:36b2 with SMTP id
 006d021491bc7-67fabc4777emr2159558eaf.28.1775059560252; Wed, 01 Apr 2026
 09:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260330122601.22140-1-fangyu.yu@linux.alibaba.com> <20260330122601.22140-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260330122601.22140-4-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Apr 2026 21:35:48 +0530
X-Gm-Features: AQROBzDM7bVlUhSWF6Q8E65n0DpGAN3y24N8aEA-TFGvi-8F5L0Cn7-ZT4MJS6I
Message-ID: <CAAhSdy0ri8sWZn0CsCpfSgNqXw5gEesfKxcKqc56azVOrqz86w@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_170602_296935_8E3AC4AC 
X-CRM114-Status: GOOD (  21.59  )
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

T24gTW9uLCBNYXIgMzAsIDIwMjYgYXQgNTo1NuKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBFeHRlbmQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCgpIHRvIHByb2Jl
IGFsbCBIR0FUUC5NT0RFIHZhbHVlcwo+IHN1cHBvcnRlZCBieSB0aGUgaG9zdCBhbmQgcmVjb3Jk
IHRoZW0gaW4gYSBiaXRtYXNrLiBLZWVwIHRyYWNraW5nIHRoZQo+IG1heGltdW0gc3VwcG9ydGVk
IEctc3RhZ2UgcGFnZSB0YWJsZSBsZXZlbCBmb3IgZXhpc3RpbmcgaW50ZXJuYWwgdXNlcnMuCj4K
PiBBbHNvIHByb3ZpZGUgbGlnaHR3ZWlnaHQgaGVscGVycyB0byByZXRyaWV2ZSB0aGUgc3VwcG9y
dGVkLW1vZGUgYml0bWFzawo+IGFuZCB2YWxpZGF0ZSBhIHJlcXVlc3RlZCBIR0FUUC5NT0RFIGFn
YWluc3QgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5h
bGliYWJhLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3Nz
LnF1YWxjb21tLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdl
LmggfCAxMSArKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAgICAgICB8
IDQzICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzQg
aW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9n
c3RhZ2UuaAo+IGluZGV4IDcwZDlkNDgzMzY1ZS4uYmJmOGY0NWM2NTYzIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiBAQCAtMzEsNiArMzEsNyBAQCBzdHJ1Y3Qga3ZtX2dz
dGFnZV9tYXBwaW5nIHsKPiAgI2VuZGlmCj4KPiAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcga3ZtX3Jp
c2N2X2dzdGFnZV9tYXhfcGdkX2xldmVsczsKPiArZXh0ZXJuIHUzMiBrdm1fcmlzY3ZfZ3N0YWdl
X3N1cHBvcnRlZF9tb2RlX21hc2s7Cj4KPiAgI2RlZmluZSBrdm1fcmlzY3ZfZ3N0YWdlX3BnZF94
Yml0cyAgICAgMgo+ICAjZGVmaW5lIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX3NpemUgICAgICAoMVVM
IDw8IChIR0FUUF9QQUdFX1NISUZUICsga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfeGJpdHMpKQo+IEBA
IC0xMDIsNCArMTAzLDE0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX2lu
aXQoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgc3RydWN0IGt2bSAqCj4gICAgICAgICBnc3Rh
Z2UtPnBnZF9sZXZlbHMgPSBrdm0tPmFyY2gucGdkX2xldmVsczsKPiAgfQo+Cj4gK3N0YXRpYyBp
bmxpbmUgdTMyIGt2bV9yaXNjdl9nZXRfaGdhdHBfbW9kZV9tYXNrKHZvaWQpCj4gK3sKPiArICAg
ICAgIHJldHVybiBrdm1fcmlzY3ZfZ3N0YWdlX3N1cHBvcnRlZF9tb2RlX21hc2s7Cj4gK30KPiAr
Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBrdm1fcmlzY3ZfaGdhdHBfbW9kZV9pc192YWxpZCh1bnNp
Z25lZCBsb25nIG1vZGUpCj4gK3sKPiArICAgICAgIHJldHVybiBrdm1fcmlzY3ZfZ3N0YWdlX3N1
cHBvcnRlZF9tb2RlX21hc2sgJiBCSVQobW9kZSk7Cj4gK30KPiArCj4gICNlbmRpZgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5j
Cj4gaW5kZXggN2M0YzM0YmMxOTFiLi40NTkwNDEyNTVjMTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rdm0vZ3N0YWdlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0x
Niw2ICsxNiw4IEBAIHVuc2lnbmVkIGxvbmcga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVs
cyBfX3JvX2FmdGVyX2luaXQgPSAzOwo+ICAjZWxzZQo+ICB1bnNpZ25lZCBsb25nIGt2bV9yaXNj
dl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgX19yb19hZnRlcl9pbml0ID0gMjsKPiAgI2VuZGlmCj4g
Ky8qIEJpdG1hc2sgb2Ygc3VwcG9ydGVkIEhHQVRQLk1PREUgZW5jb2RpbmdzIChCSVQoSEdBVFBf
TU9ERV8qKSkuICovCj4gK3UzMiBrdm1fcmlzY3ZfZ3N0YWdlX3N1cHBvcnRlZF9tb2RlX21hc2sg
X19yb19hZnRlcl9pbml0Owo+Cj4gICNkZWZpbmUgZ3N0YWdlX3B0ZV9sZWFmKF9fcHRlcCkgICAg
ICAgIFwKPiAgICAgICAgIChwdGVfdmFsKCooX19wdGVwKSkgJiAoX1BBR0VfUkVBRCB8IF9QQUdF
X1dSSVRFIHwgX1BBR0VfRVhFQykpCj4gQEAgLTMxNSw0MiArMzE3LDQzIEBAIHZvaWQga3ZtX3Jp
c2N2X2dzdGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFfdCBzdGFy
dCwgZ3BhX3QgZW5kCj4gICAgICAgICB9Cj4gIH0KPgo+ICtzdGF0aWMgYm9vbCBfX2luaXQga3Zt
X3Jpc2N2X2hnYXRwX21vZGVfc3VwcG9ydGVkKHVuc2lnbmVkIGxvbmcgbW9kZSkKPiArewo+ICsg
ICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgbW9kZSA8PCBIR0FUUF9NT0RFX1NISUZUKTsKPiAr
ICAgICAgIHJldHVybiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkg
PT0gbW9kZSk7Cj4gK30KPiArCj4gIHZvaWQgX19pbml0IGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9k
ZXRlY3Qodm9pZCkKPiAgewo+ICsgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9k
ZV9tYXNrID0gMDsKPiArICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSAw
Owo+ICsKPiAgI2lmZGVmIENPTkZJR182NEJJVAo+IC0gICAgICAgLyogVHJ5IFN2NTd4NCBHLXN0
YWdlIG1vZGUgKi8KPiAtICAgICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1
N1g0IDw8IEhHQVRQX01PREVfU0hJRlQpOwo+IC0gICAgICAgaWYgKChjc3JfcmVhZChDU1JfSEdB
VFApID4+IEhHQVRQX01PREVfU0hJRlQpID09IEhHQVRQX01PREVfU1Y1N1g0KSB7Cj4gLSAgICAg
ICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSA1Owo+IC0gICAgICAg
ICAgICAgICBnb3RvIGRvbmU7Cj4gKyAgICAgICAvKiBUcnkgU3YzOXg0IEctc3RhZ2UgbW9kZSAq
Lwo+ICsgICAgICAgaWYgKGt2bV9yaXNjdl9oZ2F0cF9tb2RlX3N1cHBvcnRlZChIR0FUUF9NT0RF
X1NWMzlYNCkpIHsKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRf
bW9kZV9tYXNrIHw9IEJJVChIR0FUUF9NT0RFX1NWMzlYNCk7Cj4gKyAgICAgICAgICAgICAgIGt2
bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSAzOwo+ICAgICAgICAgfQo+Cj4gICAgICAg
ICAvKiBUcnkgU3Y0OHg0IEctc3RhZ2UgbW9kZSAqLwo+IC0gICAgICAgY3NyX3dyaXRlKENTUl9I
R0FUUCwgSEdBVFBfTU9ERV9TVjQ4WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Cj4gLSAgICAgICBp
ZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9E
RV9TVjQ4WDQpIHsKPiArICAgICAgIGlmIChrdm1fcmlzY3ZfaGdhdHBfbW9kZV9zdXBwb3J0ZWQo
SEdBVFBfTU9ERV9TVjQ4WDQpKSB7Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vf
c3VwcG9ydGVkX21vZGVfbWFzayB8PSBCSVQoSEdBVFBfTU9ERV9TVjQ4WDQpOwo+ICAgICAgICAg
ICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzID0gNDsKPiAtICAgICAgICAg
ICAgICAgZ290byBkb25lOwoKS2VlcCB0aGUgb3JpZ2luYWwgYXBwcm9hY2ggdW50aWwgdGhlbiBO
QUNLIHRvIHRoaXMgc2VyaWVzLgoKUmVnYXJkcywKQW51cAoKPiAgICAgICAgIH0KPgo+IC0gICAg
ICAgLyogVHJ5IFN2Mzl4NCBHLXN0YWdlIG1vZGUgKi8KPiAtICAgICAgIGNzcl93cml0ZShDU1Jf
SEdBVFAsIEhHQVRQX01PREVfU1YzOVg0IDw8IEhHQVRQX01PREVfU0hJRlQpOwo+IC0gICAgICAg
aWYgKChjc3JfcmVhZChDU1JfSEdBVFApID4+IEhHQVRQX01PREVfU0hJRlQpID09IEhHQVRQX01P
REVfU1YzOVg0KSB7Cj4gLSAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9s
ZXZlbHMgPSAzOwo+IC0gICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gKyAgICAgICAvKiBUcnkg
U3Y1N3g0IEctc3RhZ2UgbW9kZSAqLwo+ICsgICAgICAgaWYgKGt2bV9yaXNjdl9oZ2F0cF9tb2Rl
X3N1cHBvcnRlZChIR0FUUF9NT0RFX1NWNTdYNCkpIHsKPiArICAgICAgICAgICAgICAga3ZtX3Jp
c2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNrIHw9IEJJVChIR0FUUF9NT0RFX1NWNTdYNCk7
Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSA1Owo+
ICAgICAgICAgfQo+ICAjZWxzZSAvKiBDT05GSUdfMzJCSVQgKi8KPiAgICAgICAgIC8qIFRyeSBT
djMyeDQgRy1zdGFnZSBtb2RlICovCj4gLSAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FU
UF9NT0RFX1NWMzJYNCA8PCBIR0FUUF9NT0RFX1NISUZUKTsKPiAtICAgICAgIGlmICgoY3NyX3Jl
YWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NWMzJYNCkg
ewo+ICsgICAgICAgaWYgKGt2bV9yaXNjdl9oZ2F0cF9tb2RlX3N1cHBvcnRlZChIR0FUUF9NT0RF
X1NWMzJYNCkpIHsKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRf
bW9kZV9tYXNrIHw9IEJJVChIR0FUUF9NT0RFX1NWMzJYNCk7Cj4gICAgICAgICAgICAgICAgIGt2
bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSAyOwo+IC0gICAgICAgICAgICAgICBnb3Rv
IGRvbmU7Cj4gICAgICAgICB9Cj4gICNlbmRpZgo+Cj4gLSAgICAgICAvKiBLVk0gZGVwZW5kcyBv
biAhSEdBVFBfTU9ERV9PRkYgKi8KPiAtICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9s
ZXZlbHMgPSAwOwo+IC0KPiAtZG9uZToKPiAgICAgICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIDAp
Owo+ICAgICAgICAga3ZtX3Jpc2N2X2xvY2FsX2hmZW5jZV9ndm1hX2FsbCgpOwo+ICB9Cj4gLS0K
PiAyLjUwLjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK

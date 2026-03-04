Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D09EB7EB8
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FX+VXt6TxGC/tCBHJ+8H+jhTRPGKEzAKDSB89RKo/0g=; b=sAKSM7v/nO0lA1
	nn3Ilm6LAleobkn/NDaKvJNxZptKFJnUpA8f9SzNy5DPtTp/hgst7DX4ZyfMIsaoFdmuoYIakce8b
	Iea07gpMP85YtyCUjE1KMjinqBGDxgQ9y3KJQWOj5XBmwfGY7rS6Hh4uIHHJOJ/li0BPaphvZiikn
	gchhMznEb68i6zjU1i7gSNwDqzqIVrxSl7rAVyqSa/thEwpVSzkSBjN36HWFejHtk31NXDXfN9DbC
	M+KDkHJqMyDj7ep/zWolHsB2QSEsOHmRsTrQZEiiy12qN6EwDAzmiEnzuqORUTe15cWtE2Pgjj8aC
	rdMv35QFVR1P3J+HXAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk5s-0000000H3R5-3ivj;
	Wed, 04 Mar 2026 11:08:44 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxk5q-0000000H3QB-1P4s
	for kvm-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 11:08:43 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6729292dcd7so3933200eaf.0
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Mar 2026 03:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772622521; cv=none;
        d=google.com; s=arc-20240605;
        b=ZrLPEkNuTESS4KNaSwoHaj3dHAw5XO7InXudses7Gh8sQ+8rvxkwhLrc53VhzvuyM7
         8IHyfVi8yBeZ1tm7AcnKqHt/C3vk8FmYl3LiMtAIoQ4vl0VcjPkO/SU+5hKeEolTggDM
         d0NceNY9eVsf3PuvKEw+2UUuEto5hXeHF1xEiOYeTIGXHKU/P+7KB0DLjnpZS4uvO3cm
         8P/mA+xVNjVHnr7AkL2zEp12Q02f7+0SOhqC70mBVC5MUOg2Q63k0d5F7pNSjyMxlziH
         D/0BlI+HteNVXfeAQYBHEo/FpThGEteHhrTfaxZfdIy+PuqEs2+P96p8wcYy4Z3/NPSO
         lRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20V0HsiRCM8u2CycbPAhWN5bAO7CHOUhSKzXrUPLlhE=;
        fh=P51Jryk7p7oN4eSxJCPMVtGoWXIlUBkOmQe77TlJNPY=;
        b=ZiZdbdCUDbHXf3pgKBcwvRK6DDdcVb0Hr54ePQOr2DEf01XuxmuV9rq5m+qjOmKtVx
         nT19C8SAk/ocjeB+Tb1+pIffZoCQ+MWZf2wFqls2bmwnDF26JpGRE+FT7TafGRvJbD5N
         XQ1osdA6S4F6hHqFdmOCMkJJNI2HiAnULEavHtQJH6BIpkWvdODc5mT3F/rZHMlx6ffv
         4WyZebAInOtx12Bg274cMtSuWXpBaE2m8JKHDQaFP90Xs+6uk386dye2OVcfYmV4dsLC
         XsIoNjah1VEQIhxVF/0872F7RQs0mgO+kZshnoHzKoUo2b0IATASAM1V9TpZwK9xyon2
         IRnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772622521; x=1773227321; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20V0HsiRCM8u2CycbPAhWN5bAO7CHOUhSKzXrUPLlhE=;
        b=0TdzYEAdsfIQIyHOGvX7ProYWojA8+be0CgdftfJFfhk5ek+Veblp+Fi+iQxjPd+Rn
         XXLXknveDygQOcvJSDm4rbrb2gtz1lGYskBquV3Scpwn4TRgy5xDU3qBomroa024vrik
         +puSuqsa/2u/bw828Ua+v2fPic7Mn9PdXMQMoREV/FmOe1hpkRwOxo9MbT3xpVE/k1+9
         17VGnsBtm0++Sk8/uFLMvaWZij3bGXCXQWzH47k/PtP7sAz4kguyaENsAERlRdqCvCTW
         fnvL8uXquq9D+C2DC4dpWEpV2JKefhUvjTm/MaEEEitOmaysgRya9DEZqY23vHB/zYj0
         lCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622521; x=1773227321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20V0HsiRCM8u2CycbPAhWN5bAO7CHOUhSKzXrUPLlhE=;
        b=Viv1vR71aZUzChE2N3CIoDtVnDdAgamF3BFUpTqVHhFn/9l87c5gffqjH1TBF9QMXy
         ZbcFm1W7lyqtVe05bTGIrxNPbnbsmNaCeopR2w7LA84Ek3uIcrAJUuivqCemeoOORE28
         Aaz2Ur82O3pPiWA++kwDYFjyC/Ah7eLAxxvX8KqL2KYrj6ESB3TvsXdpLK82zHQlC+Nb
         gaGhm7NCQdjI1JQEjobBzzL1Y1eCcjj35Yb57yoOkXESQMDJXPtSUiz8XvfMZkF42HqT
         FnRwIXQmmm2NJ9lvLAhVFSdq6lSiBdHEKTx3ixUzz9PTHHFmac0//3iqkS/1kTXmGv9j
         7jbg==
X-Forwarded-Encrypted: i=1; AJvYcCUa+5CtlSktzTV8XA+u7eRS4G3023L9u3PJTWkOo9jE5Wn+EWoe/EZbpW1SZsnfDB9WeutjELLmDEw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2rWh8QL+cW8l8/NDRg4jDfpL23xLwFwwm+qWoXQpG/nWEKIgg
	Y5eg0jJs0lcsA4i08iwjVenHg0pXEjwOIzTBDva3yey/yIAm+8PqQYw1HM8c2dlN76ntA19gY/O
	24S7l4XjgukWaQYAwYERpPYojwr6UzyHV78FlMeRMeDnSr9WGlNAf
X-Gm-Gg: ATEYQzzUTEt5QS29GbEK7knrohTyQUrE8M6ZPs1KQj6n5mLwKghnzYqlud+yixCSS40
	SF0B1++caImB7chowguZHd1niENnfsKGofmH6CawC7p08Gw+r80vRN7p8KsxeN5uswubmnpxmGS
	f2ohtrYyCvTdmNd8x8i+LKhzjkglPeq+FZ3G7QBJ2OZA8geO3MCOQD4IBJv3Mu6iCyytdY4/mFV
	HXmJC1hYlXZ8n8PyevQurGW6DP8KrMC3ylaMyMTJEzM9enueJqhhyY8QClt6PJ3v0lIXD83lqe4
	oJk3vYJUbjwVo0ycCDXSJYGxEQBT/XzXspdNMyMxz5PGWD1Kcw372kFBzk2BX2oKdy4tJI9VQmE
	kykXvEvPgUFHMa6IvrAQO4dyUSK4=
X-Received: by 2002:a05:6820:f021:b0:679:a463:c933 with SMTP id
 006d021491bc7-67b1e932124mr914892eaf.71.1772622520701; Wed, 04 Mar 2026
 03:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
In-Reply-To: <20260303-kvm-riscv-spectre-v1-v2-0-192caab8e0dc@cispa.de>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Mar 2026 16:38:29 +0530
X-Gm-Features: AaiRm50FApq9ik0ETo3HXP7rfW4o3U8qtmgzjhKd-QdWkzujkTa_K8xattka4x8
Message-ID: <CAAhSdy0nkke8sJR-wV9nrzc=VqdY4igYu9c8g14qudbEeR=27g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] KVM: riscv: Fix Spectre-v1 vulnerabilities in
 register access
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Daniel Weber <daniel.weber@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>, 
	Marton Bognar <marton.bognar@kuleuven.be>, Jo Van Bulck <jo.vanbulck@kuleuven.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_030842_629714_D3EE8506 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCA3OjQ54oCvUE0gTHVrYXMgR2VybGFjaCA8bHVrYXMuZ2Vy
bGFjaEBjaXNwYS5kZT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBhZGRzIGFycmF5X2luZGV4X25v
c3BlYygpIHRvIFJJU0MtViBLVk0gdG8gcHJldmVudAo+IHNwZWN1bGF0aXZlIG91dC1vZi1ib3Vu
ZHMgYWNjZXNzIHRvIGtlcm5lbCBtZW1vcnkuCj4KPiBTaW1pbGFyIGZpeGVzIGV4aXN0IGZvciB4
ODYgKGlvYXBpYywgbGFwaWMsIFBNVSkgYW5kIGFybTY0ICh2Z2ljKS4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEx1a2FzIEdlcmxhY2ggPGx1a2FzLmdlcmxhY2hAY2lzcGEuZGU+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MjoKPiBBZGQgYXJyYXlfaW5kZXhfbm9zcGVjKCkgdG8gZm91ciBhZGRpdGlvbmFsIHNp
dGVzIGluIHZjcHVfcG11LmMKPiAoUmFkaW0gS3LEjW3DocWZKQo+Cj4gLS0tCj4gTHVrYXMgR2Vy
bGFjaCAoNCk6Cj4gICAgICAgS1ZNOiByaXNjdjogRml4IFNwZWN0cmUtdjEgaW4gT05FX1JFRyBy
ZWdpc3RlciBhY2Nlc3MKPiAgICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBpbiBBSUEg
Q1NSIGFjY2Vzcwo+ICAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIGZsb2F0aW5n
LXBvaW50IHJlZ2lzdGVyIGFjY2Vzcwo+ICAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYx
IGluIFBNVSBjb3VudGVyIGFjY2Vzcwo+Cj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAg
fCAxMSArKysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmMgICAgIHwgMTcgKysr
KysrKysrKysrKy0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyB8IDM2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Bt
dS5jICAgIHwgMTQgKysrKysrKysrKystLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRp
b25zKCspLCAxNyBkZWxldGlvbnMoLSkKClF1ZXVlZCB0aGVzZSBwYXRjaGVzIGFzIGZpeGVzIGZv
ciBMaW51eC03LjAtcmNYCgpUaGFua3MsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0
Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

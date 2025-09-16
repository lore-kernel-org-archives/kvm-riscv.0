Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0BACAC599
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 05:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPjxUOsPf30X5dFB2VsqxNr3K5//6QzFT/RiUyn6EB8=; b=iknbnlcz5akzUv
	yLt1zatU+/emXuX8xkMSNgtnq1rhhXOBsoGRlesCNxU+NTAGLtVSrPSdJBOJV6yfqa5b35cs7tLqG
	bFq6babg7H30pQ0O95jFvloRW20Lc+15G3kcXVWenE5I5J2sKplzrdYqyAH/z+4e6ZU+sCkgVq4mZ
	7/qvaSHjjIKYTnJ/JiC8uvgCwnFsAzznwuFuVnorGPDmaLvugTfLc+hBipCgs1QJXGjq5BKUomajt
	YjzhNPHLkHvQqTXjC7wxeSjAcbGghww/DU24GNhOf5wg7VEJ+0qwKdrIEBnq/jWrme0PSap7OEU3s
	e24PKz7QeJF054KKVP6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOOh-00000006pQV-1M2g;
	Tue, 16 Sep 2025 05:38:35 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyOOe-00000006pPl-35HM
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 05:38:34 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-42403719ae6so10298185ab.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 22:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758001111; x=1758605911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+WY6S8XVjX9ojiFBX/w421kmUHPYta2U/tJO3CWfRQ=;
        b=h4zlzzTL/q5MW8Bz3ofIBD80wRqKRTc4QrH7NRqC6vcz3h7IM4n8hHCADDNm4gDwbM
         q5YKa4+eOn+v6PEreZi/8h0HtbFlVffFlJ7uDZxM2zCGDGDcC3e1bL5TwIoXBBSzshMK
         io4aU6blyKIdVVcuMewnlLm20G+A0iw5BvMoo0AojvMFG4vFOWDUGquVCRL2T24/3/ys
         gyQOAsD/1qd1nYfjg/XCW5nTHPKYWRx49pG+kInkb2d+4G2TqtqW8TZBPZ1pS6BmAhk8
         pqFJlNtFknIxhX575/K9A97EIENdySr6c9V78QdCxXMt2EDDOZpC9Dw0/85pQjHtUzG+
         QJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001111; x=1758605911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+WY6S8XVjX9ojiFBX/w421kmUHPYta2U/tJO3CWfRQ=;
        b=O0dghswHBwJAjjUWngd7chTYXf+SC+0ufCWwYXrEjI4lzS3I+EYhdbEPCgq9jAE+wa
         /bYQx2JkRIJ7vFfocWVg0pFV40Czocs48vM6nNe+8k8AbGZ7yhbGel264SEJnRWZpqdE
         hYtui52QL6IWhPfJvFOorM+XzIKymyKNFstkStKmXN+BfVFNAEdedTYsRAlMyQmtjy3P
         O95emfAgpYgcy7VIJUq9zW60K4ZJygo+c3Auo4HfQepr9BrC1AYDgmUINw6XD+bTfvVz
         e/rBf8PS0qjJ550F+nY0aBP5BvxVCb/+i611Ukg7LjeZP8vh73KY+LunM9rMo4M88CzM
         4eBw==
X-Forwarded-Encrypted: i=1; AJvYcCU4/4kZ6FJKZYYcqg86snxzu2ejBzkslQW3uJyq6FT2KW7hNYmh3YgEOcnMFdHSzu7adkECfqzAcpc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3+QY1zzI4jzPp1YPRscKx2eupauPphewgVLuk/JnjSZdbJZfI
	x6bknG8McrgA/bOrIVMz1XHvV4JVesyFbBM4XjQrfJvqWIPCBCwtk4mYP2mhzFygp36wrCQRcAk
	PJQtNiXwUz9Zfk5qQntud1sniKJHIIj1SK5N0i90O7A==
X-Gm-Gg: ASbGnctvXQQoU6ufWIJWg9IlmjrC9GRPFv0rDRvUhvxaRwSTxNcC7Y3RJwwJq0jz4z5
	SDpcTIc5vbHIprJg/uQ2Uy2br/kS9K9NYsfUDoFKLtWPu+06oqvfTDH2OY5q4KnT3b9E7bjyVv8
	Ghv27bO7lmEYcbIFbJhbF+iRHYRifKrGXwmQJsyxC1lEUBrgrXzEphz8W5fe+WNFEsUtAGe9KJ6
	8h43Ei7bla9oAItOw/Lp4aING7rkl3FzFuxnZ4ZUdBVaV9+Z+U=
X-Google-Smtp-Source: AGHT+IHEt+IV7wo/STForhbe+5Ighy2VX2akKFvAUd+sccpOkUTGCayf1IFAZQMilDDqxxtkhwZJapH5I41ohgtHAys=
X-Received: by 2002:a05:6e02:19ce:b0:412:fa25:dd4e with SMTP id
 e9e14a558f8ab-4209d40ff57mr142917585ab.1.1758001111530; Mon, 15 Sep 2025
 22:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250915053431.1910941-1-samuel.holland@sifive.com>
In-Reply-To: <20250915053431.1910941-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Sep 2025 11:08:18 +0530
X-Gm-Features: AS18NWBBYp29jcrefVqIqieCZ6Bs58izD3mGRcYk8wb5X3Ucta-UItSPTxLvHGw
Message-ID: <CAAhSdy1Gg+k5U8WoFGkJvv+0TSg9mrSVCj4JTHay29uUc1_exA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix SBI_FWFT_POINTER_MASKING_PMLEN algorithm
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_223833_049262_0EA0BC54 
X-CRM114-Status: GOOD (  21.84  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgMTE6MDTigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgaW1wbGVtZW50YXRpb24gb2YgU0JJ
X0ZXRlRfUE9JTlRFUl9NQVNLSU5HX1BNTEVOIGZyb20gY29tbWl0Cj4gYWEwNGQxMzFiODhiICgi
UklTQy1WOiBLVk06IEFkZCBzdXBwb3J0IGZvciBTQklfRldGVF9QT0lOVEVSX01BU0tJTkdfUE1M
RU4iKQo+IHdhcyBiYXNlZCBvbiBhIGRyYWZ0IG9mIHRoZSBTQkkgMy4wIHNwZWNpZmljYXRpb24s
IGFuZCBpcyBub3QgY29tcGxpYW50Cj4gd2l0aCB0aGUgcmF0aWZpZWQgdmVyc2lvbi4KPgo+IFVw
ZGF0ZSB0aGUgYWxnb3JpdGhtIHRvIGJlIGNvbXBsaWFudC4gU3BlY2lmaWNhbGx5LCBkbyBub3Qg
ZmFsbCBiYWNrIHRvCj4gYSBwb2ludGVyIG1hc2tpbmcgbW9kZSB3aXRoIGEgbGFyZ2VyIFBNTEVO
IGlmIHRoZSBtb2RlIHdpdGggdGhlCj4gcmVxdWVzdGVkIFBNTEVOIGlzIHVuc3VwcG9ydGVkIGJ5
IHRoZSBoYXJkd2FyZS4KPgo+IEZpeGVzOiBhYTA0ZDEzMWI4OGIgKCJSSVNDLVY6IEtWTTogQWRk
IHN1cHBvcnQgZm9yIFNCSV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTiIpCj4gU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4g
SSBzYXcgdGhhdCB0aGUgUkZDIHZlcnNpb24gb2YgdGhpcyBwYXRjaCBhbHJlYWR5IG1hZGUgaXQg
aW50bwo+IHJpc2N2X2t2bV9xdWV1ZSwgYnV0IGl0IG5lZWRzIGFuIHVwZGF0ZSBmb3IgcmF0aWZp
ZWQgU0JJIDMuMC4gRmVlbCBmcmVlCj4gdG8gc3F1YXNoIHRoaXMgaW50byB0aGUgb3JpZ2luYWwg
Y29tbWl0LCBvciBJIGNhbiBzZW5kIGEgcmVwbGFjZW1lbnQgdjIKPiBwYXRjaCBpZiB5b3UgcHJl
ZmVyLgoKU2luY2UgdGhpcyBpcyBmaXhpbmcgYSBjb21taXQgaW4gcmlzY3Zfa3ZtX3F1ZXVlLCBJ
IGhhdmUgc3F1YXNoZWQgdGhpcwpwYXRjaCBpbnRvIHRoZSByZXNwZWN0aXZlIGNvbW1pdCBhbG9u
ZyB3aXRoIERyZXcncyBSZXZpZXdlZC1ieS4KClRoYW5rcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3NiaV9md2Z0LmMgfCAxNyArKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMKPiBpbmRleCBjYWNiM2Q0NDEwYTU0Li42MmNjOWMzZDU3NTk5IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX2Z3ZnQuYwo+IEBAIC0xNjAsMTQgKzE2MCwyMyBAQCBzdGF0aWMgbG9uZyBrdm1fc2Jp
X2Z3ZnRfc2V0X3BvaW50ZXJfbWFza2luZ19wbWxlbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4g
ICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0ICpmd2Z0ID0gdmNwdV90b19md2Z0KHZjcHUpOwo+
ICAgICAgICAgdW5zaWduZWQgbG9uZyBwbW07Cj4KPiAtICAgICAgIGlmICh2YWx1ZSA9PSAwKQo+
ICsgICAgICAgc3dpdGNoICh2YWx1ZSkgewo+ICsgICAgICAgY2FzZSAwOgo+ICAgICAgICAgICAg
ICAgICBwbW0gPSBFTlZDRkdfUE1NX1BNTEVOXzA7Cj4gLSAgICAgICBlbHNlIGlmICh2YWx1ZSA8
PSA3ICYmIGZ3ZnQtPmhhdmVfdnNfcG1sZW5fNykKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICBjYXNlIDc6Cj4gKyAgICAgICAgICAgICAgIGlmICghZndmdC0+aGF2ZV92c19wbWxl
bl83KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFS
QU07Cj4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19QTU1fUE1MRU5fNzsKPiAtICAgICAg
IGVsc2UgaWYgKHZhbHVlIDw9IDE2ICYmIGZ3ZnQtPmhhdmVfdnNfcG1sZW5fMTYpCj4gKyAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSAxNjoKPiArICAgICAgICAgICAgICAgaWYg
KCFmd2Z0LT5oYXZlX3ZzX3BtbGVuXzE2KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biBTQklfRVJSX0lOVkFMSURfUEFSQU07Cj4gICAgICAgICAgICAgICAgIHBtbSA9IEVOVkNGR19Q
TU1fUE1MRU5fMTY7Cj4gLSAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsg
ICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9Q
QVJBTTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyAmPSB+
RU5WQ0ZHX1BNTTsKPiAgICAgICAgIHZjcHUtPmFyY2guY2ZnLmhlbnZjZmcgfD0gcG1tOwo+IC0t
Cj4gMi40Ny4yCj4KPiBiYXNlLWNvbW1pdDogNzgzNWI4OTJkMWQ5ZjUyZmI2MTUzNzc1N2FhNDQ2
ZmI0NDk4NDIxNQo+IGJyYW5jaDogdXAva3ZtLWZ3ZnQtcG1sZW4KCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

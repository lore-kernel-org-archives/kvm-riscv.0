Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB41F3D60F
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5KQDjZ3/GzFLPgNm/Er3sm7aOFz2YWJ56bM1FadYmo=; b=Y7dsHHvSyVyjae
	Y1MUiLxirLqAnmkv8q5I0EKuUdumovYE8DS47s2Pw6i/cOFksab/dPRw3JtEuW9r/Ogsj9kf4/4oj
	euAbpk66lqRgOC/Bs9U7oHbzyxjmh9igBjMOY24hdrrlfXraKlgtZYe8CBDAfAnjqbdECv7s5256o
	bK2yrz+cG97OqnlhSwbq8JY4e2tzRQ9FxRVbjnuPx/erRX8cWNxCBDoQ+K7yeSxUYx8fL9vqh0nMn
	p15w4ddYGZ6CiF8QYovwrDb61ej5Dvv5uD4NRDEsQTtpf1Uw6D4Wsp9HYS8Y0SNc1oGL1U2ZfyR+f
	wlPQB3UHeRwvUA3LhzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xX-0000000Aqvh-3So7;
	Mon, 30 Mar 2026 08:26:55 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77xW-0000000Aqu6-0l4t
	for kvm-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:26:55 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-67bbea1e090so2444213eaf.3
        for <kvm-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774859213; cv=none;
        d=google.com; s=arc-20240605;
        b=b0IQ7awlibwIel3M1RvwxSan7cNRpd/YghPOzy6/nu109OPjndp6PtvqGvQB5dZKr5
         NvguZk+7fFEQPbmJkzezCcVUQyzZFfSjlM65jpPtYUeuJjhG+C5UV3S7coeqKoLnaal7
         vQICQExQK+DgVpXzs2SsvZhTgOh/psaLeX5If7CwyyEVwvsvtrueE4vK3CboHl8O7fcX
         mQRJURvhVjjpJBT5KPvPZSUcvdGOO2sN8sR+cxczhd6+xVorE1P4QMJTumajkH+hn8bm
         arB2MGnNCy3rQOOoc4clUxBS6zBme8bLMtke83WzrPce4BbuiikIY2WkkDNIXOTJl1Dc
         c+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=feNTViC8MFBS6AQiIqWex0bCSJJNY3jWANzumtuP1Dw=;
        fh=5yFDzCglPsfifI29q0AjrjYFefAp51CEBaTQLTxrFds=;
        b=cZ2NApSDRDsn0i6/oD6EO5IyQ39DVmoZH1zHy/BV6pV2P46JlMWzgy4rkyrZVpPpRM
         GVrVVteoTuOGee7mT8Rn3m8sk1gWjPFTASYPhm5P48Ds7/Bgox+5ZioXQMEfYI+ZOoe6
         xyGGV3rQK/IMoIV4NBSR+OpssN9VHW/7NbLbdelfGrNSfL7m0zb9oLax6RA7OdwPN7t1
         T7gidWSQYLQmuw89yhleofC+zQkseN2ulfIpIkL+lrOz0yRHDDQsum/SYQJ5L1SYbqFO
         ux8zAjMihROpKJ9rbphfLH1WcsUMr4v6poo/8lAXo6ySK80BmKtQAB5WxkDFU4jdelvz
         mLIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774859213; x=1775464013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feNTViC8MFBS6AQiIqWex0bCSJJNY3jWANzumtuP1Dw=;
        b=BrHHh5bDHvz0scQ3IZz71EHJNMakCITmni4wVUbiyvdV3L6Y7y1+sMkUGC3mEtmXTZ
         3d6xBO63ntTKyur9Fv7dGVV8L/a5dqsiPm9YuK6GMvlbpVSOZxRdxEiRX0busqEku7Na
         njvSApGsk/nTWePKsBh7uFkom8oXhaaEsFUN59RNazwgQKmcJl1nc/J5uiM1xzjctnbN
         WvW4qr3Gat+8upqY1XfDWeVM4JAdrJH/DQJfuBXJWx1y+pVXZEW/JgzFBrhdi4SaJMkA
         L6/9V8eg9zJ6RSdl7Y04ilLXflC9rYq1RYN7h5O0RmSYDGl9NBC7l4gtxokG66q0lENR
         XxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859213; x=1775464013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feNTViC8MFBS6AQiIqWex0bCSJJNY3jWANzumtuP1Dw=;
        b=rQYBMPYKEhFxrKmsP9qfAm4+huazpbKl9s7soYB25wa4mTH1xPSNhIGh3feMu9gzCV
         zf6Cmf/hOqJM78AXwYnz7Dx2mEMgxdBCFi43Ujk0T+UM0aA8DXHTHrla1ks22hTKVIj0
         Va38k4B6i90FBqBMFe04JICSIYn3w7B9ww70LfNWNexECnIST60Iu55FS+zlNzbZe49B
         pn/u02wU5d25fKgkt+fYsNW3e347vCtQDBQZC0aTvNC+yS59pNE8FNQMORN54xJdIuLd
         AxQrNNfPI12p6eOf59Eee4YSaF9ZWyUBlCwd4CkrNwVCL5/eilaxjtR2lNfKEzRi/ZHE
         WC7g==
X-Gm-Message-State: AOJu0YxLLFPiCURVU4cjCY/9yCb2wSaaE1vClMYBC3agOAL0S+yFXPfe
	JhfktKK1Gspwi5OETeXWVoJRXUmTiibPM5YhWpjcCQGEJW61DV3HRvTHBVlhs7M3veAcK4kYjoc
	Gc3mRmORm3KWczde9+pgZcUxw8aga5fSusb1NLprqAA==
X-Gm-Gg: ATEYQzwKwzV/DmNuyqEFj7pulH1LOp00h97+Pdk8tJL237PLxbXAHVu2WhO82jV0JfQ
	YAxU7hflaaEUibPXOpAx8X+uBZAG9NgKaVP7KbImg2Y1SEmyY3uIWeK2rosLQbnYpMsf9sNT/4R
	TwGAnPbVQb+Up2MOAUMNZTZJstqHWQQdNX0CEsY6H9OCjd+qiHKsvWBumUwHEY7AvBo9TjWfFKa
	hMypY2x2SX8WdWbCYlf5e/SLQnMEBPt0+K5fDsJbj2QULrRuA4esr030s6te8W61vJ4hX8yLGYx
	x/sqLyToWHPiq8vWJ2J/kj+eVjKtBibw7XM7Mpx5aW4+PaDXN4MgCPrSHhlz7qpVtQSzsCXu3L1
	1WZfCKBWLlJ9tPf453u8MngJgqA==
X-Received: by 2002:a05:6820:8188:b0:67c:f1d7:3d50 with SMTP id
 006d021491bc7-67e186566fdmr6317419eaf.32.1774859213091; Mon, 30 Mar 2026
 01:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260319035902.924661-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260319035902.924661-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 30 Mar 2026 13:56:41 +0530
X-Gm-Features: AQROBzD8YcMhVDsongcGEG3uL_G8BwWLXwkEeCGZRFqCzB5qKwscWNn1JiDFjFg
Message-ID: <CAAhSdy0nu1kCYxo2gmpHAgdQKFSUPb36fBoUELE-LLf_BwSO9w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix integer overflow in kvm_pmu_validate_counter_mask()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_012654_234253_D2CDE5DF 
X-CRM114-Status: GOOD (  24.25  )
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

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgOToyOeKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFdoZW4gYSBndWVzdCBpbml0aWF0ZXMgYW4gU0JJX0VY
VF9QTVVfQ09VTlRFUl9DRkdfTUFUQ0ggY2FsbCB3aXRoCj4gY3RyX2Jhc2U9MHhmZmZmZmZmZmZm
ZmZmZmZlLCBjdHJfbWFzaz0weGViNWYgYW5kIGZsYWdzPTB4MQo+IChTQklfUE1VX0NGR19GTEFH
X1NLSVBfTUFUQ0gpLCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2NmZ19tYXRjaCgpCj4gZmlyc3Qg
aW52b2tlcyBrdm1fcG11X3ZhbGlkYXRlX2NvdW50ZXJfbWFzaygpIHRvIHZlcmlmeSB3aGV0aGVy
Cj4gY3RyX2Jhc2UgYW5kIGN0cl9tYXNrIGFyZSB2YWxpZCwgYnkgZXZhbHVhdGluZzoKPiAgIWN0
cl9tYXNrIHx8IChjdHJfYmFzZSArIF9fZmxzKGN0cl9tYXNrKSA+PSBrdm1fcG11X251bV9jb3Vu
dGVycyhrdnBtdSkpCj4KPiBXaXRoIHRoZSBhYm92ZSBpbnB1dHMsIF9fZmxzKDB4ZWI1ZikgZXF1
YWxzIDE1LCBhbmQgYWRkaW5nIDE1IHRvCj4gMHhmZmZmZmZmZmZmZmZmZmZlIGNhdXNlcyBhbiBp
bnRlZ2VyIG92ZXJmbG93LCB3cmFwcGluZyBhcm91bmQgdG8gMTMuCj4gU2luY2UgMTMgaXMgbGVz
cyB0aGFuIGt2bV9wbXVfbnVtX2NvdW50ZXJzKCksIHRoZSB2YWxpZGF0aW9uIHdyb25nbHkKPiBz
dWNjZWVkcy4KPgo+IFRoZXJlYWZ0ZXIsIHNpbmNlIGZsYWdzICYgU0JJX1BNVV9DRkdfRkxBR19T
S0lQX01BVENIIGlzIHNhdGlzZmllZCwKPiB0aGUgY29kZSBldmFsdWF0ZXM6Cj4gICF0ZXN0X2Jp
dChjdHJfYmFzZSArIF9fZmZzKGN0cl9tYXNrKSwga3ZwbXUtPnBtY19pbl91c2UpCj4KPiBIZXJl
IF9fZmZzKDB4ZWI1ZikgZXF1YWxzIDAsIHNvIHRlc3RfYml0KCkgcmVjZWl2ZXMgMHhmZmZmZmZm
ZmZmZmZmZmZlCj4gYXMgdGhlIGJpdCBpbmRleCBhbmQgYXR0ZW1wdHMgdG8gYWNjZXNzIHRoZSBj
b3JyZXNwb25kaW5nIGVsZW1lbnQgb2YKPiB0aGUga3ZwbXUtPnBtY19pbl91c2UsIHdoaWNoIHJl
c3VsdHMgaW4gYW4gaW52YWxpZCBtZW1vcnkgYWNjZXNzLiBUaGlzCj4gdHJpZ2dlcnMgdGhlIGZv
bGxvd2luZyBPb3BzOgo+ICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBh
dCB2aXJ0dWFsIGFkZHJlc3MgZTNlYmZmZmYxMmFiYmE4OQo+ICAgZ2VuZXJpY190ZXN0X2JpdCBp
bmNsdWRlL2FzbS1nZW5lcmljL2JpdG9wcy9nZW5lcmljLW5vbi1hdG9taWMuaDoxMjgKPiAgIGt2
bV9yaXNjdl92Y3B1X3BtdV9jdHJfY2ZnX21hdGNoIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmM6
NzU4Cj4gICBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9w
bXUuYzo0OQo+ICAga3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxsIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmM6NjA4Cj4gICBrdm1fcmlzY3ZfdmNwdV9leGl0IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhp
dC5jOjI0MAo+Cj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCBrdm1fcG11X3ZhbGlkYXRlX2NvdW50
ZXJfbWFzaygpIGRvZXMgbm90IGFjY291bnQKPiBmb3IgdGhlIGNhc2Ugd2hlcmUgY3RyX2Jhc2Ug
aXRzZWxmIGlzIG91dCBvZiByYW5nZSwgYWxsb3dpbmcgdGhlCj4gc3Vic2VxdWVudCBhZGRpdGlv
biB0byBzaWxlbnRseSBvdmVyZmxvdyBhbmQgYnlwYXNzIHRoZSBjaGVjay4KPgo+IEZpeCB0aGlz
IGJ5IGV4cGxpY2l0bHkgdmFsaWRhdGluZyBjdHJfYmFzZSBhZ2FpbnN0IGt2bV9wbXVfbnVtX2Nv
dW50ZXJzKCkKPiBiZWZvcmUgcGVyZm9ybWluZyB0aGUgYWRkaXRpb24uCj4KPiBUaGlzIGJ1ZyB3
YXMgZm91bmQgYnkgZnV6emluZyB0aGUgS1ZNIFJJU0MtViBQTVUgaW50ZXJmYWNlLgo+Cj4gRml4
ZXM6IDBjYjc0YjY1ZDJlNWU2ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBwZXJmIHN1cHBvcnQg
d2l0aG91dCBzYW1wbGluZyIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFu
dXRAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlz
Y2FzLmFjLmNuPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMQoKVGhhbmtzLApBbnVw
CgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyB8IDYgKysrKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMK
PiBpbmRleCBlODczNDMwZTU5NmIyLi5hMDk4YTliNDE3YWQ4IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4g
QEAgLTI2Niw4ICsyNjYsMTAgQEAgc3RhdGljIGludCBwbXVfY3RyX3JlYWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCj4gIHN0YXRpYyBpbnQga3ZtX3BtdV92YWxp
ZGF0ZV9jb3VudGVyX21hc2soc3RydWN0IGt2bV9wbXUgKmt2cG11LCB1bnNpZ25lZCBsb25nIGN0
cl9iYXNlLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBjdHJfbWFzaykKPiAgewo+IC0gICAgICAgLyogTWFrZSBzdXJlIHRoZSB3ZSBoYXZl
IGEgdmFsaWQgY291bnRlciBtYXNrIHJlcXVlc3RlZCBmcm9tIHRoZSBjYWxsZXIgKi8KPiAtICAg
ICAgIGlmICghY3RyX21hc2sgfHwgKGN0cl9iYXNlICsgX19mbHMoY3RyX21hc2spID49IGt2bV9w
bXVfbnVtX2NvdW50ZXJzKGt2cG11KSkpCj4gKyAgICAgICB1bnNpZ25lZCBsb25nIG51bV9jdHJz
ID0ga3ZtX3BtdV9udW1fY291bnRlcnMoa3ZwbXUpOwo+ICsKPiArICAgICAgIC8qIE1ha2Ugc3Vy
ZSB3ZSBoYXZlIGEgdmFsaWQgY291bnRlciBtYXNrIHJlcXVlc3RlZCBmcm9tIHRoZSBjYWxsZXIg
Ki8KPiArICAgICAgIGlmICghY3RyX21hc2sgfHwgY3RyX2Jhc2UgPj0gbnVtX2N0cnMgfHwgKGN0
cl9iYXNlICsgX19mbHMoY3RyX21hc2spID49IG51bV9jdHJzKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+IC0tCj4gMi4zNC4xCj4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==

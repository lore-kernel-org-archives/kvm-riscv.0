Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22948C5AC7A
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WJtoGptdatyLA77/f/eAT1WRhPDEwzkQJyy3Ut3vzE=; b=pxW22Qbuw7JahI
	Jw2W6qEHu3/u0ngY9xe2J69rfFZcW7RW4QmB3uh/3i76DWp+sSpbP+IjHNXXQjPyJN+D5EUTij+ev
	msj1HBLJIMcvbJaZXPiIS4nWLm5OtLOL6AOABAJ4FCuWcMJ5b028wm5TO4N/P8vRSejy9WsRQpR+u
	TpA62MPW3wLwbC5xBbhZ+LIbtwklwmRAzdYZ2Oe93x9s4MOZumT6ZBwF2d19b+E/seuk3hWICFuxv
	09Ms+Ak1ZcRNXppuItQF2y8m3StVV0Kv3y4Ov+xqAH9WOpA1ZEtznq+iThZKUjSgGXUQ3bennlGRo
	Ha2AKRU8bFgwsO5jnjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcd-00000008RXe-3DnC;
	Fri, 07 Aug 2026 16:40:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNca-00000008RV2-25Iq
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 16:40:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f84023916so3320115f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Aug 2026 09:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120834; cv=none;
        d=google.com; s=arc-20260327;
        b=G1FKBdWG2YGhc+NIBvmXt1fOvesxvI8IBQ4CudQ+Mer67PZmVu7c/Nk1YOOZtw81q5
         5F+vB0VuSwSjlz/BQYk357QPkao1w+AXC9DOd5+gwktoTVNLQzZcV7YERakdEAE5PSkz
         SxO/eJWWMH3L3qG2R1YQeFLAkpOBSw7xBTa76OTD1oFuyCblhTCgYG3Uj9FSY5LKwCAF
         lrdsH1dgy4A6OTBsW0GpjYi7lpuCbfVyHMe5LLLnkIPPxdp0ClFk0YvC4BRV78yZ/OPw
         3mPTts4L1ZYbR6AXwMK/tUyVe2sjUU9zI3nU6mlchxKsALi7HfkTUJAC6jKtfJEUJvSi
         25Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivwd8b6C0kvbJOzxDYFzgKuMZMZM9eaqiKpZX0jjZbI=;
        fh=52CFHWZBB/q6Byb/Np5CA771y/dQIBO5wf72uOtUKyc=;
        b=V6xvvBDU7+j0YPzZiDPHlmRhSrPQyGp1CuvASOv4w4g0JZfsXPCReqvmVFKqoGyCti
         UNMJYc5v0vpjXl8vLwfl5aGaJG70RDPmMlgCtYdoSsV6HkD4ypmBIg6pHyNVuhtzK+2j
         k5kRTgpD7F5bdiNeRXqJ22fFRqY9UR0ZMcZxQt0K4aD6zAMl4arXKVAyxN/nKCE4qNJg
         yjCD2zKIS/jRxD8222Kaq/lrT5yuV/n7iqr9nuLWwxyfSbE3YdmsTbGvStfobzpc8B/0
         8uBgqonfhMXZO0YkkFBw9C3x/JLZdx+9BrC4k+wDFOeOPBxl+3p4SGKzaR+IwOOVkSmu
         qA0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786120834; x=1786725634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ivwd8b6C0kvbJOzxDYFzgKuMZMZM9eaqiKpZX0jjZbI=;
        b=uf2B79vvYzeL+mqtexVBncUwCCfWIGLibKQfC8OGKJ+xriNQR5jL9clKOw4DqvS9ny
         FZ1vfLFwqUAV4Sb0z3eYnpx4Mvj4FfzOzQVdP8+gY6RUgzz5Q7FNh1FVGHNUeZFi7Ta9
         8GeMHCigynyv0BUV9WOaoqLqSz0h8vVLZ+6CUa5v/p/aoQFpWF6KYFb385XuxvyH8MPE
         C+il6ewa4KhcwxBYV/t6ZO8zCBScRY2sGj5a/pthDduHzStBEsUB0TKS+Jibf+ipYlx2
         3Sai9BS2MQityXXXKTqbcNrLZBeaIsF5Uszi4ZhjGM7+e0dAdAwNj1WzxwnnYh+e/wVN
         TPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120834; x=1786725634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ivwd8b6C0kvbJOzxDYFzgKuMZMZM9eaqiKpZX0jjZbI=;
        b=fDrStU3FYtiKe3ki6gkDF4/VhbGSYS2VJZJjk1zXlA04mmGzQU6kSkdGnTTO9P3u1N
         M873Rr7x6nvOdEyHyh9t6RBRi+kQiOi8Jl12io2hq2DBE5rG6y08e1s/5HruHZE3hMqr
         H2preiAmjolD3bGoLrpUBIuB/qwPnawwCH9FinTSnr39Z1+6CiuvJRTH+dZP1pkrgQ5I
         nxhjIwWK+SraVbOQqSL364FqEvYI98jiElrVW0JCwCHjACncdDTmNQ5D5d7Gdtgxuy9p
         43vLfXnjwh76WEARb/RtR4nQ8RCRCakG17BfNit4AWlZCrxR5P99wmih/ZS9zQoCZjWd
         WEgg==
X-Forwarded-Encrypted: i=1; AHgh+RpND/XeFp8ALbfWpvGQASm2VgMBjge1/FNDziAJBdadPyucFgYxj9f6I7vLjxqa95a0NTg0LX8ykT0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwMemE8BPiP55I3EW2P6qVVF2QCVvWvskr4RzidmS9sGLmqlPl
	q1lET6mxnWoM8YW8QudapzeZ0D0vb5EnwYCXh+Ue9g2ZDwHxUBBKC6/7BgQrNBQMCa4cD8wnPp1
	c+GciqX9iUeuWM0eb0JidIeBW+uGyUDgwPe863Cd/sA==
X-Gm-Gg: AR+sD11yeSI4Re2rtP3huOy5jzKKj9hDsHqEWy1rESAROH+Oe3CfYAF9czGls7SJQHd
	DsD0BJLJDJ0aWp/mW+QCcgkLO1N0S+npqj6nah+4nIs1+5hGqKZdk1ladipxMM5viMhSBXHkGri
	J0oE2PPpIrULdZLtUy6pGxB/bl0jLqq0Pqhvcs2ktm9C6EFAuW+9IC+KQmqlksadPK6Q153LmDl
	w1qoHs0UNmA4nlhTJx1jdmq8h1G8DOoNUWi0oIk4E8/jwKkQp5a885VbXfQNVzXBkELvFNMkLTb
	C7UYysIxg9eFK0OHt2WoYODnN6tlVYgnKIG1wshFlVdIqZ2bZ9zkeB73072TJvm8JxxcPK6U/SS
	F2eJ0FrdMbD1F3FXO0kZ/LzzHgoyLPAaEO/rlTFEqJSOuMKFpivPK4gNxGlsMRIcG
X-Received: by 2002:a05:6000:491e:b0:47d:ee9d:90c8 with SMTP id
 ffacd0b85a97d-47fec4e2910mr44316338f8f.3.1786120834611; Fri, 07 Aug 2026
 09:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260718040000.005.6ede2881-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.005.6ede2881-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Aug 2026 22:10:23 +0530
X-Gm-Features: AUfX_mwYx18eRgllpSc1cuoaEbtIanIWNOsGbSu5y1XnuqpHv0835ozA8nP-WMI
Message-ID: <CAAhSdy2j+0sV0_XD=ieDgSDPTK8eAxJBy6EFjR+yFxT0XH-5cQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Reject overlapping AIA IMSIC address fields
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094036_573648_06A0FB0A 
X-CRM114-Status: GOOD (  16.08  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTA6MDXigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEtWTSBsZXRzIHVzZXJzcGFjZSBjb25maWd1cmUgdGhl
IElNU0lDIGd1ZXN0LCBIQVJULCBncm91cC13aWR0aCwgYW5kCj4gZ3JvdXAtc2hpZnQgZmllbGRz
IGluZGVwZW5kZW50bHkuIFRoZSBpbmRpdmlkdWFsIGJvdW5kcyBhbGxvdyBhIGxheW91dAo+IHN1
Y2ggYXMgZ3Vlc3RfYml0cz03LCBoYXJ0X2JpdHM9NiwgZ3JvdXBfYml0cz0xLCBhbmQgZ3JvdXBf
c2hpZnQ9MjQuCj4KPiBUaGF0IGxheW91dCBwbGFjZXMgdGhlIGdyb3VwIGluZGV4IGJpdCBhdCBi
aXQgMjQgd2hpbGUgdGhlIGxvd2VyCj4gZ3Vlc3QrSEFSVCBmaWVsZCBhbHNvIGV4dGVuZHMgdGhy
b3VnaCBiaXQgMjQuIFRoZSBJTVNJQyBhZGRyZXNzIGhlbHBlcnMKPiBsYXRlciBjb25zdW1lIHRo
ZXNlIHZhbHVlcyBhcyBvbmUgYWRkcmVzcyBsYXlvdXQ6IGFpYV9pbXNpY19wcG4oKSBtYXNrcwo+
IHRoZSBsb3dlciBndWVzdCtIQVJUIGZpZWxkIGFuZCB0aGUgZ3JvdXAgZmllbGQsIHdoaWxlCj4g
YWlhX2ltc2ljX2hhcnRfaW5kZXgoKSBjb21iaW5lcyB0aGUgZ3JvdXAgYW5kIEhBUlQgaW5kZXgu
IEFsbG93aW5nIGFuCj4gb3ZlcmxhcHBpbmcgY29uZmlndXJhdGlvbiB0aGVyZWZvcmUgZ2l2ZXMg
b25lIGFkZHJlc3MgYml0IHR3byBkaWZmZXJlbnQKPiBtZWFuaW5ncy4KPgo+IFJlamVjdCBncm91
cC1pbmRleCBsYXlvdXRzIHRoYXQgc3RhcnQgYmVmb3JlIHRoZSBlbmQgb2YgdGhlIGd1ZXN0K0hB
UlQKPiBmaWVsZCBiZWZvcmUgaW5pdGlhbGl6aW5nIHRoZSBpbi1rZXJuZWwgaXJxY2hpcC4KPgo+
IEZpeGVzOiA4OWQwMTMwNmUzNGQgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IGRldmljZSBpbnRl
cmZhY2UgZm9yIEFJQSBpcnFjaGlwIikKPiBTaWduZWQtb2ZmLWJ5OiBQZW5ncGVuZyBIb3UgPHBl
bmdwZW5nQGlzY2FzLmFjLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTcuMwoKVGhhbmtz
LApBbnVwCgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jIHwgNiArKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+IGlu
ZGV4IGJlODNjMmQ1ZmMzMDguLjA3OTNkNGQ0Y2Y1ZTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vYWlhX2RldmljZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jCj4g
QEAgLTI0OCw2ICsyNDgsMTIgQEAgc3RhdGljIGludCBhaWFfaW5pdChzdHJ1Y3Qga3ZtICprdm0p
Cj4gICAgICAgICBpZiAoYWlhLT5ucl9zb3VyY2VzICYmIGFpYS0+YXBsaWNfYWRkciA9PSBLVk1f
UklTQ1ZfQUlBX1VOREVGX0FERFIpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
Cj4gKyAgICAgICAvKiBHcm91cCBpbmRleCBiaXRzIG11c3Qgbm90IG92ZXJsYXAgZ3Vlc3QgYW5k
IEhBUlQgaW5kZXggYml0cy4gKi8KPiArICAgICAgIGlmIChhaWEtPm5yX2dyb3VwX2JpdHMgJiYK
PiArICAgICAgICAgICBhaWEtPm5yX2dyb3VwX3NoaWZ0IDwgSU1TSUNfTU1JT19QQUdFX1NISUZU
ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhaWEtPm5yX2d1
ZXN0X2JpdHMgKyBhaWEtPm5yX2hhcnRfYml0cykKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gKwo+ICAgICAgICAgLyogSW5pdGlhbGl6ZSBBUExJQyAqLwo+ICAgICAgICAgcmV0
ID0ga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbml0KGt2bSk7Cj4gICAgICAgICBpZiAocmV0KQo+IC0t
Cj4gMi40My4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==

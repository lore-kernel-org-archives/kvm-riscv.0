Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806D4CA601E
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0j+lui/14ogYomvkYJrpoxnZVwjYkH7QPY1z6zNxU8=; b=iPCeotkHq1kdKz
	lNw1ez/j1FNHivZSIxUf8TwcE/WYJ5akA3AT3+wB0uXGFkTf0BpbJLPpaOpwLDo+UAaWnedzVgsZM
	+bsgAjH7XuISVkKAegtzBzyzwfeolvGGUhiRoKUF3fq4ZVS821etORFP+Gn6nlzjr+jU0uX8QMAhc
	1usFGvnYyL4pdUb2CDFemYtNaJYjeQnmFGdhV41K51kDVOcj5KMmaX4UJX546Oj0ZmCZG8+Y1oda4
	KvpkfMcQ/AsSGPuIIKjNdImhfJXP2ina2m5cZOu4xZHrVXSWskCcW8KM6yDaZIDKV0IeD3APCC05l
	Wjr5/p7fAn2rZ5xQuvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFS7-0000000706C-2cmz;
	Fri, 09 Oct 2026 18:36:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFS3-0000000702q-1Z4n
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 18:36:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48b03f23305so81924f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Oct 2026 11:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791570974; cv=none;
        d=google.com; s=arc-20260327;
        b=INj4TsK4QWWXCr3ZBGVoaY6OQeO8Wfo1N3HT3aBBgmd/YhRX+ZDt3pjlnUYWe3Povc
         gc1CdNlPuXFoqgezsn8/44xq5Ya5HW+t5g8tPe3116e2sTmR8+RI0rhvWkM00oqcb7c5
         RqXfPiaPmcy/n+pvmWX8krqxqaqLP3LDn+x93RwnI9mLg3ax9txCbWQv3aTucf9ItTCL
         TUykHWnpUfiajOzWl9HkWORSLQCP8caSqtZZKcpkWvDGXjMTRlsNlFLXFzoGjYLF7aUn
         fsxFyY7iwJzDqYlSJQpUGSRqqxDp5rdx9Rgz1RtXYLl2xBVOUSoJBs7aFWtth/fBO+Du
         xdCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        fh=1DLWFyJzKJoIygKoK43r+Ty/zB658//gVzBHWUDGwMU=;
        b=V+uzKlzkDjm9zdHGl6m/bokoYQPysfru5tMBx192sRETw0n8iE+vxFUIndT/QLQ8mR
         Nq8hnxvsIwSiD6aSnl9N5zaXMDbTOA9PdlVFK6/Px8ZImYLqEDoUoRjZG3j9rGulgs6u
         yFeUpoGG5eQxbJ+9XB+0fpC3XLrc1XpEPJsnj/SbbIcEQ1Ecv6mbfvrSa5WNbFFKZXl+
         z/CMQnlEVCu8aV/9nwi9wPtFxhfgCOr4guuxMWLGYVL3pE1gufe+lnpUxVlNJX9MRc0c
         ydLN8Zey6ifi/jJwQUDUXrvsK6ZVAZVBxX2+LJ/fGPxToZ/M/XHRJOaBFH7OHuudjR/I
         halg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791570974; x=1792175774; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        b=fIMv2CwEVy1LZZbLr5qs1Ih8QvE8vFrSqb/vFEDK8v4jKRQzI5ZDOT5aY3bg/osCWD
         U/+mDigJTnUu7XTRBNw1JbA96ssfM/8mQbNRJjyYqClTd6aapIT7CiHHqNXuAjQP7pAL
         860i4S9FPJII+ezUJ6l3Cspx77JXt2heioGB7OZYF7yMWIjscjWyHGfO9bQ8xdDWSQlf
         2YV2Wc956cIcvqJrkg38OjWqTgSRREgNx+pa5UxOukQZme2ETPuBpdbqR9xXnWtU/IaC
         Ac4D2sjMui1u91VvV/jFmsO/7L18dqj9oWN32oTnDDd0gP8ZtSalyXvHwiL7bcOxmfzt
         Y/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570974; x=1792175774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        b=OAbWFVjPNJxwkAieppciNoYxFEm5Z5H3HK5YalheUdBoR8YOJlqEM+Oug5sDkm8C9+
         spsuv6/uSZqrMbjBjnuLhuldpZGyvN3PtCfpF8s03ddTwoZETtrwZdZq4eL2JWwHtBf8
         JHI6KIYCDrRITSykUn3LBE8ReYUGTljriYiSPttywpSdMUDm+ea5a84halBG3ySG0Ol/
         hRWN3aBEvaSbseKSpJq5tHrtgKMugPlR+XYcvSqynpfCARwgJ8oveNoKH4rXRgZI65EB
         Y+d2Vh4Xp4IjKiLB3TKAQXwzqAKOR7cnzehKvCmO+abEjlCFzXqv5Vr7r/A+lKBVj4tX
         8jqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdTKG2FG/suMiNYugJel32snTs2N9ELOzjhAjc/lRS/egmItYDi3G90VdI/p9LFz2r0BKpNBPag6M=@lists.infradead.org
X-Gm-Message-State: AFq9FYKyAADM//T7vD9IIaVFfioZOju7ttCRawGO36kF/lm0JozgM1DT
	hk4anxBdyY8GE1VyiZRClT8AtTUyAkxkFhQ9rHb3S7TZeR8qmILB8bZQVXGUcC2tmgHKfTrSyCb
	8Jn7TMxNwzzLofHWzIr3125lVlYJmudqpDVIX8BagYQ==
X-Gm-Gg: AYBFou1xCAwd9kxMAsOhud3KuP4pLn809FqD2efDvJJzcOqC94Mj1ZEqCRbJWjN290A
	JHVrsl7/Xk+So4PGQ2NlItLouvQW6G0wWare1IbSpGh+VoNlwtIyU0nDLeMpEMbKPKtb+SMmYri
	T5AXNntUkck1ykaWxRgCPom9PIcFfnRpKDX4OcscicBGPL516Iu+z8qU4aJXDNQTEzYrIGuWuLi
	YEzq3tNsAlCn150Ch+drz5sXjNyJDNzKblbANVfVY7Imk5M8wkKeKk00DvHigBQJetRKZtc2wxF
	U5ohePyJj1V1oq0bMXtNC4hGTL9HTqszno/BZbQcF1jfyGb6nClAn/tpmA66adlsULn3kFOFmNE
	h6s4Wb4UXgvvw+kjwKJleK0m9L6B8j4K0V0qDF2PyYU/w29gHqqnWCN/pMsl6jiF8ueqiAGMmQQ
	==
X-Received: by 2002:adf:f147:0:b0:488:8ab9:f73e with SMTP id
 ffacd0b85a97d-48dbaae4878mr3989428f8f.24.1791570973627; Fri, 09 Oct 2026
 11:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260911152314.1076817-1-wenlongli486@gmail.com>
In-Reply-To: <20260911152314.1076817-1-wenlongli486@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 20:36:02 +0200
X-Gm-Features: AclHuK-TLWsKgkGzLv0QJ_8v3oC-5fn5auBcEXlemKFFcSbIf24vnAAecN-RL7k
Message-ID: <CAAhSdy0zM+g=roVNZcQi5eV_=kpPM1TvsgenTd8WEeoX7-tyWA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Avoid synchronous IPIs on VMID rollover
To: Wenlong Li <wenlongli486@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_113615_633121_BF82E3FE 
X-CRM114-Status: GOOD (  20.70  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgNToyNOKAr1BNIFdlbmxvbmcgTGkgPHdlbmxvbmdsaTQ4
NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGN1cnJlbnQgVk1JRCByb2xsb3ZlciBwYXRoIHN5
bmNocm9ub3VzbHkgaW52b2tlcyBIRkVOQ0UuR1ZNQSBvbgo+IGFsbCBvbmxpbmUgQ1BVcyB1c2lu
ZyBvbl9lYWNoX2NwdV9tYXNrKCkuIFRoaXMgc2VuZHMgSVBJcyB0byByZW1vdGUKPiBDUFVzIGFu
ZCBjYXVzZXMgYSB2Q1BVIHJ1bm5pbmcgaW4gZ3Vlc3QgbW9kZSBvbiBhIHRhcmdldGVkIENQVSB0
byBleGl0Lgo+IFRoZSByb2xsb3ZlciBwYXRoIHRoZW4gd2FpdHMgZm9yIGFsbCBDUFVzIHRvIGNv
bXBsZXRlIHRoZWlyIGxvY2FsIFRMQgo+IGZsdXNoZXMgYmVmb3JlIFZNSUQgYWxsb2NhdGlvbiBj
YW4gY29udGludWUuCj4KPiBNYWtlIFZNSUQgcm9sbG92ZXIgbGF6eSB0byByZW1vdmUgdGhpcyBj
cm9zcy1DUFUgc3luY2hyb25pemF0aW9uLgo+Cj4gVHJhY2sgYWN0aXZlIGFuZCByZXNlcnZlZCBz
b2Z0d2FyZSBWTUlEcyBmb3IgZWFjaCBwb3NzaWJsZSBDUFUuIE9uCj4gcm9sbG92ZXIsIHByZXNl
cnZlIGhhcmR3YXJlIFZNSURzIHRoYXQgbWF5IHN0aWxsIGhhdmUgc3RhbGUKPiB0cmFuc2xhdGlv
bnMsIGNsZWFyIHRoZSBhY3RpdmUgVk1JRCwgYW5kIG1hcmsgYSBsb2NhbCBUTEIgZmx1c2gKPiBw
ZW5kaW5nIGZvciBlYWNoIENQVS4KPgo+IERvIG5vdCBzZW5kIElQSXMgb3Igb3RoZXJ3aXNlIGZv
cmNlIHJlbW90ZSB2Q1BVcyB0byBleGl0IGR1cmluZwo+IHJvbGxvdmVyLiBJbnN0ZWFkLCB3aGVu
IGEgQ1BVIG5leHQgYWN0aXZhdGVzIGEgVk1JRCBiZWZvcmUgZ3Vlc3QKPiBlbnRyeSwgcGVyZm9y
bSB0aGUgcGVuZGluZyBsb2NhbCBIRkVOQ0UuR1ZNQSwgaW5zdGFsbCB0aGUgY3VycmVudAo+IGhh
cmR3YXJlIFZNSUQgaW4gSEdBVFAsIGFuZCBvbmx5IHRoZW4gcHVibGlzaCB0aGUgbmV3IGFjdGl2
ZSBWTUlELgo+Cj4gVXNlIHRoZSBzYW1lIHNvZnR3YXJlIFZNSUQgc25hcHNob3QgZm9yIGJvdGgg
SEdBVFAgcHJvZ3JhbW1pbmcgYW5kCj4gYWN0aXZlIHB1YmxpY2F0aW9uLiBXaGVuIHN3aXRjaGlu
ZyBpZGVudGl0aWVzIG9uIHRoZSBmYXN0IHBhdGgsIHByb2dyYW0KPiBIR0FUUCBiZWZvcmUgY21w
eGNoZy4gQSBjb25jdXJyZW50IHJvbGxvdmVyIGNsZWFycyBhY3RpdmUsIG1ha2luZyB0aGUKPiBj
bXB4Y2hnIGZhaWwgYW5kIGZvcmNpbmcgYWN0aXZhdGlvbiB0aHJvdWdoIHRoZSBsb2NrZWQgc2xv
dyBwYXRoLgo+Cj4gUGVyZm9ybSBWTUlEIGFjdGl2YXRpb24gYWZ0ZXIgcHJlZW1wdGlvbiBpcyBk
aXNhYmxlZCBpbiB0aGUgZ3Vlc3QKPiBlbnRyeSBwYXRoLiBUaGlzIGtlZXBzIHRoZSBwZXItQ1BV
IGFjdGl2ZSBWTUlEIGFuZCBwZW5kaW5nIGZsdXNoIHN0YXRlCj4gYXNzb2NpYXRlZCB3aXRoIHRo
ZSBzYW1lIENQVSB0aGF0IHN1YnNlcXVlbnRseSBlbnRlcnMgZ3Vlc3QgbW9kZS4KPgo+IEtlZXAg
cmVzZXJ2ZWQgaGFyZHdhcmUgVk1JRHMgdW5hdmFpbGFibGUgdG8gdGhlIGJpdG1hcCBhbGxvY2F0
b3IKPiB3aGlsZSBzdGFsZSB0cmFuc2xhdGlvbnMgYXNzb2NpYXRlZCB3aXRoIHRoZW0gbWF5IHN0
aWxsIGV4aXN0LiBUaGlzCj4gcHJldmVudHMgYSBoYXJkd2FyZSBWTUlEIGZyb20gYmVpbmcgcmV1
c2VkIHByZW1hdHVyZWx5IGFmdGVyIGEKPiBnZW5lcmF0aW9uIHJvbGxvdmVyLgo+Cj4gUmVwcmVz
ZW50IGEgc29mdHdhcmUgVk1JRCBhcyBhIDY0LWJpdCB2YWx1ZSBjb21iaW5pbmcgYSBnZW5lcmF0
aW9uCj4gd2l0aCBhIGhhcmR3YXJlIFZNSUQsIGluZGVwZW5kZW50IG9mIFhMRU4uIFRoaXMga2Vl
cHMgdGhlIGdlbmVyYXRpb24KPiBzcGFjZSBsYXJnZSBvbiBSVjMyIHdoaWxlIGhhcmR3YXJlIFZN
SURzIGFuZCBiaXRtYXAgaW5kaWNlcyByZW1haW4KPiBuYXRpdmUgdW5zaWduZWQgbG9uZyB2YWx1
ZXMuIEV4dHJhY3Qgb25seSB0aGUgaGFyZHdhcmUgVk1JRCB3aGVuCj4gcHJvZ3JhbW1pbmcgSEdB
VFAgb3IgaXNzdWluZyBWTUlELXNwZWNpZmljIGZlbmNlcy4KPgo+IFJlc2VydmUgc29mdHdhcmUg
Vk1JRCAwIGFzIHRoZSB1bmFsbG9jYXRlZCBpZGVudGlmaWVyLiBXaGVuIHRoZQo+IGdlbmVyYXRp
b24gY291bnRlciB3cmFwcyB0byAwLCBjb21wdXRlIHRoZSBuZXh0IG5vbnplcm8gZ2VuZXJhdGlv
bgo+IGxvY2FsbHkgYW5kIHB1Ymxpc2ggaXQgYXRvbWljYWxseSwgc28gZ2VuZXJhdGlvbiAwIGlz
IG5ldmVyIHZpc2libGUgdG8KPiBsb2NrbGVzcyByZWFkZXJzLgo+Cj4gUmVzZXJ2ZSBoYXJkd2Fy
ZSBWTUlEIDAuIERpc2FibGUgVk1JRCBhbGxvY2F0aW9uIHdoZW4gdGhlIGhhcmR3YXJlCj4gVk1J
RCBzcGFjZSBpcyB0b28gc21hbGwgdG8gcmV0YWluIG9uZSByZXNlcnZlZCBWTUlEIHBlciBwb3Nz
aWJsZSBDUFUKPiB3aGlsZSBzdGlsbCBsZWF2aW5nIGEgVk1JRCBhdmFpbGFibGUgZm9yIGEgbmV3
IGFsbG9jYXRpb24uCj4KPiBJbnZhbGlkYXRlIHRoZSBwZXItQ1BVIFZNSUQgYm9va2tlZXBpbmcg
d2hlbiB2aXJ0dWFsaXphdGlvbiBpcwo+IGRpc2FibGVkLCBzbyBzdGFsZSBHLXN0YWdlIHRyYW5z
bGF0aW9ucyBhcmUgZmx1c2hlZCBiZWZvcmUgdGhlIENQVQo+IG5leHQgZW50ZXJzIGEgZ3Vlc3Qu
Cj4KPiBUaGlzIHJlbW92ZXMgSVBJcyBhbmQgcmVtb3RlIENQVSBzeW5jaHJvbml6YXRpb24gZnJv
bSB0aGUgVk1JRAo+IHJvbGxvdmVyIHBhdGgsIGF2b2lkaW5nIFZNIGV4aXRzIGNhdXNlZCBzb2xl
bHkgYnkgVk1JRCBleGhhdXN0aW9uIG9uCj4gYW5vdGhlciBDUFUuCj4KPiBUZXN0ZWQgb24gUUVN
VSB3aXRoIHR3byBob3N0IENQVXMgYW5kIHRoZSBWTUlEIHdpZHRoIHRlbXBvcmFyaWx5Cj4gZm9y
Y2VkIHRvIDIgYml0cy4gUmVwZWF0ZWQgcm9sbG92ZXIsIHByb3RlY3Rpb24gYWdhaW5zdCBwcmVt
YXR1cmUgVk1JRAo+IHJldXNlLCBhY3RpdmF0aW9uLXZlcnN1cy1yb2xsb3ZlciBzdHJlc3MsIGFu
ZCB2Q1BVIG1pZ3JhdGlvbiB3ZXJlCj4gZXhlcmNpc2VkIHdpdGggbXVsdGlwbGUgY29uY3VycmVu
dCBndWVzdHMgd2l0aG91dCBndWVzdCBmYWlsdXJlcyBvcgo+IGhvc3Qgd2FybmluZ3MuCgpOQUNL
LgoKVGhlIHN5bmNocm9ub3VzIElQSSBvbiBWTUlEIHJvbGwtb3ZlciBpcyByZXF1aXJlZCBmb3Ig
Y29ycmVjdG5lc3Mgc28KdGhhdCBhbGwgcnVubmluZyBHdWVzdHMvVk1zIGltbWVkaWF0bHkgdXBk
YXRlIHRoZWlyIFZNSUQuCgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

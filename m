Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9615DC77B7F
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zm6BjEOlRQMYE5h1YiftsNCqPdGpaPtMt396/4Jif54=; b=KziU4xobghmUl/
	L+HPfqVQxlqkqCKoyA5Pd6cXAMiz/xHUT4ft+Qgujg6qxoqpPBBwbAWGiWvx24vk6xSkmraaSLzQk
	RkmFj7+7f80nbZl4gdSzKLl8iDMtVh1MtOMjNZSFnjU9f9EWjuIGvZdwNt7ThdP5G2dhHYxxpBws4
	wPV2hrqe6DoIFKWiRGTseErNB8Vd0Bk/xqeeGtqQpgkIyF3iPUkOGjqKJYlcIgPdAap/32eelLgeA
	3YWSFYVNiDQXwB/ysxG3sS22T4X9GrCF57wKYxc1P1oLmxnOBl+PKkwHbjfpygSk0m/ziU5vCks/R
	ttJ654HIvUQ2suOAUpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjhq-00000003Lvc-19hA;
	Mon, 23 Jun 2025 16:07:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgOm-00000002iDT-09fv
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 12:35:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2350fc2591dso34277025ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750682143; x=1751286943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2J6CJVh9SDJQfR/08bZkzuItlJ/LKWv0StLwptfBoc=;
        b=o1r4dC2uV+oE6wcjS+FW6YI/eSpM6QGVmJ97lDMkO+iP/Ktk8An0/9Y4t5Yq+lz4e8
         ezbfOcJZ20OZdFsUqMSbEmFuOrMWH8tofLptTMCUKLBhs/rc8NUuHD6xYU6jjGfVipad
         37X5ETG3AfCMe8JYUa+v+zuf+VzfG1SJ8oj7sgK7nYQZCc6Z2Es/y7wk6K9iE6RwJKDU
         FeNfBHsjjG4+ahbiBxfOQFvTdkUKaR+ZU8Fj6F8Xf9X9IdWUwOjn67crymjEwzjH/Xg5
         o3lTT4FtO4oZySMXJlVluzxNPChpkpuFNYqvOfsciUwBKH7RxuDsddmV+Iw/b35wjfJb
         eVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682143; x=1751286943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2J6CJVh9SDJQfR/08bZkzuItlJ/LKWv0StLwptfBoc=;
        b=fjM1bqsipSxesOCxuYvlDEGUq+rz9cHU2LgiQL/gNAMRaSKGaiq+6rGfT7vik8WCFo
         MzXM+JrpLT9hGTNw0adVDyvD8x8VA9s7cC6QEJ4nm3SOVJQOBNF9FUrajj97A5jvO9si
         x3xV9k7sq82arwq4hqX6r9b8omLv2+riBqBk/qqma7SCN6tJw/uxvhLZXD0trbDL5Ak1
         dD5M/ZPCGFSNHxk/yVVmHq36DqLE5G3926xyWCM9SN/DCnHg2zYc/b2guB+GqTrZ6bWy
         lebqO4W4oirHkZvR3s2lMEPFotxkZBY6d0eYH7UqMJ4TpbkckbSrzlL4lQ+turq1xiRe
         T76g==
X-Forwarded-Encrypted: i=1; AJvYcCXg9ZGMmqmPz/tkNRei29izcP3+eOTFu/Tcml62GmhasaRE/rBA4m8iwiPCGW6Ono659Z9aog00EjU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaUv1Ed93YZIRJcxCGICAMMvmba9c01zUrkBxgAkm+ALRzpZEO
	/fLbhfZrSKLc+kLInqKue/mXL43OjkX8tAl94WJwiYAUqiU3n5z7x7R+Z8T7UXnbBIw=
X-Gm-Gg: ASbGnct7f55dFPiMRneneUX+L2OJKYqCfq+20DlYBJTcoz1HXVeCDkIIRpuh1siSN1t
	qMf5er+lFmjz/f+lMgjvxknOKMmVnY9uc2CJBn8LAFqqLQVkNpS73PPcAKFhz6OhKtbBKjyNhU4
	Rv8zctyXZKQ6rzJJbKHQckG0p/PzIGNsBiWbgYKNUlYgBCmSZAyovFo8nfC45eIHDptkUwsfalq
	og3oHtSq/c6PBHHPAgH0pkLjEA1H9WVJe3QxAlMH4SCWgAU3wFeb6HiK+dY/mQnhmdfO0Mn68R3
	knFom7Yz8/jdZKkFeYs546dm49RJGZYzIuhu7Ra6JYC8f43/0qCjDWOxfYAPBodPGzlzsY1L22y
	vzOoAHUgjqmRxc31VK6it/FxZ/tEO4DQ=
X-Google-Smtp-Source: AGHT+IFhVMOOzfJS+ZMgN2t/2S1KtBErjLzrLACr83Lp9bfsIO8qJQHyS7OUG+hyXIaKHaCPahxILg==
X-Received: by 2002:a17:902:e88f:b0:231:c89f:4e94 with SMTP id d9443c01a7336-237db0d6afbmr183457395ad.21.1750682143178;
        Mon, 23 Jun 2025 05:35:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d87182b2sm83217035ad.231.2025.06.23.05.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:35:42 -0700 (PDT)
Message-ID: <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
Date: Mon, 23 Jun 2025 14:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction
 fault
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_053544_174049_CB0D3043 
X-CRM114-Status: GOOD (  17.61  )
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

CgpPbiAyMy8wNi8yMDI1IDE0OjEyLCBYdSBMdSB3cm90ZToKPiBIaSBDbMOpbWVudCwKPiAKPiBP
biBNb24sIEp1biAyMywgMjAyNSBhdCA0OjA14oCvUE0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPj4KPj4KPj4KPj4gT24gMjAvMDYvMjAyNSAxNDowNCwgUmFk
aW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4gMjAyNS0wNi0yMFQxNzoxNzoyMCswODowMCwgWHUgTHUg
PGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Ogo+Pj4+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1
Y3Rpb24gZmF1bHQgdG8gVlMgbW9kZSBpbiBkZWZhdWx0IHRvIGF2b2lkIHN1Y2gKPj4+PiBleGNl
cHRpb25zIGJlaW5nIHRyYXBwZWQgdG8gSFMgYW5kIHJlZGlyZWN0ZWQgYmFjayB0byBWUy4KPj4+
Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+
Pj4+IC0tLQo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPj4+PiBAQCAtNDgsNiArNDgs
NyBAQAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKEVYQ19J
TlNUX0lMTEVHQUwpICAgIHwgXAo+Pj4KPj4+IFlvdSBzaG91bGQgYWxzbyByZW1vdmUgdGhlIGRl
YWQgY29kZSBpbiBrdm1fcmlzY3ZfdmNwdV9leGl0Lgo+Pj4KPj4+IEFuZCB3aHkgbm90IGRlbGVn
YXRlIHRoZSBvdGhlcnMgYXMgd2VsbD8KPj4+IChFWENfTE9BRF9NSVNBTElHTkVELCBFWENfU1RP
UkVfTUlTQUxJR05FRCwgRVhDX0xPQURfQUNDRVNTLAo+Pj4gIEVYQ19TVE9SRV9BQ0NFU1MsIGFu
ZCBFWENfSU5TVF9BQ0NFU1MuKQo+Pgo+PiBDdXJyZW50bHksIE9wZW5TQkkgZG9lcyBub3QgZGVs
ZWdhdGUgbWlzYWxpZ25lZCBleGNlcHRpb24gYnkgZGVmYXVsdCBhbmQKPj4gaGFuZGxlcyBtaXNh
bGlnbmVkIGFjY2VzcyBieSBpdHNlbGYsIHRoaXMgaXMgKHBhcnRpYWxseSkgd2h5IHdlIGFkZGVk
Cj4+IHRoZSBGV0ZUIFNCSSBleHRlbnNpb24gdG8gcmVxdWVzdCBzdWNoIGRlbGVnYXRpb24uIFNp
bmNlIHNvbWUgc3VwZXJ2aXNvcgo+PiBzb2Z0d2FyZSBleHBlY3QgdGhhdCBkZWZhdWx0LCB0aGV5
IGRvIG5vdCBoYXZlIGNvZGUgdG8gaGFuZGxlIG1pc2FsaWduZWQKPj4gYWNjZXNzZXMgZW11bGF0
aW9uLiBTbyB0aGV5IHNob3VsZCBub3QgYmUgZGVsZWdhdGVkIGJ5IGRlZmF1bHQuCj4gCj4gSXQg
ZG9lc24ndCBtYXR0ZXIgd2hldGhlciB0aGVzZSBleGNlcHRpb25zIGFyZSBkZWxlZ2F0ZWQgaW4g
bWVkZWxlZy4KCk5vdCBzdXJlIHRvIHRvdGFsbHkgdW5kZXJzdGFuZCwgYnV0IGlmIHRoZSBleGNl
cHRpb25zIGFyZSBub3QgZGVsZWdhdGVkCmluIG1lZGVsZWcsIHRoZXkgd29uJ3QgYmUgZGVsZWdh
dGVkIHRvIFZTLW1vZGUgZXZlbiB0aG91Z2ggaGVkZWxlZyBiaXQKaXMgc2V0IHJpZ2h0ID8gVGhl
IHNwZWMgc2F5czoKCkEgc3luY2hyb25vdXMgdHJhcCB0aGF0IGhhcyBiZWVuIGRlbGVnYXRlZCB0
byBIUy1tb2RlICh1c2luZyBtZWRlbGVnKQppcyBmdXJ0aGVyIGRlbGVnYXRlZCB0byBWUy1tb2Rl
IGlmIFY9MSBiZWZvcmUgdGhlIHRyYXAgYW5kIHRoZQpjb3JyZXNwb25kaW5nIGhlZGVsZWcgYml0
IGlzIHNldC4KCgoKPiBLVk0gaW4gSFMtbW9kZSBkb2VzIG5vdCBoYW5kbGUgaWxsZWdhbCBpbnN0
cnVjdGlvbiBvciBtaXNhbGlnbmVkCj4gYWNjZXNzIGFuZCBvbmx5IHJlZGlyZWN0cyB0aGVtIGJh
Y2sgdG8gVlMtbW9kZS4gRGVsZWdhdGluZyBzdWNoCj4gZXhjZXB0aW9ucyBpbiBoZWRlbGVnIGhl
bHBzIHNhdmUgQ1BVIHVzYWdlIGV2ZW4gd2hlbiB0aGV5IGFyZSBub3QKPiBkZWxlZ2F0ZWQgaW4g
bWVkZWxlZzogb3BlbnNiaSB3aWxsIGNoZWNrIHdoZXRoZXIgdGhlc2UgZXhjZXB0aW9ucyBhcmUK
PiBkZWxlZ2F0ZWQgdG8gVlMtbW9kZSBhbmQgcmVkaXJlY3QgdGhlbSB0byBWUy1tb2RlIGlmIHBv
c3NpYmxlLiBUaGVyZQo+IHNlZW1zIHRvIGJlIG5vIGNvbmZsaWN0cyB3aXRoIFNTRSBpbXBsZW1l
bnRhdGlvbi4gUGxlYXNlIGNvcnJlY3QgbWUgaWYKPiBJIG1pc3NlZCBhbnl0aGluZy4KCkFGQUlV
LCB0aGlzIG1lYW5zIHRoYXQgc2luY2UgbWVkZWxlZyBiaXQgZm9yIG1pc2FsaWduZWQgYWNjZXNz
ZXMgd2VyZQpub3QgZGVsZWdhdGVkIHVwIHRvIHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIEZXRlQg
ZXh0ZW5zaW9uLCBWUy1tb2RlCmdlbmVyYXRlZCBtaXNhbGlnbmVkIGFjY2Vzc2VzIHdlcmUgaGFu
ZGxlZCBieSBPcGVuU0JJIHJpZ2h0ID8gTm93IHRoYXQKd2UgYXJlIHJlcXVlc3Rpbmcgb3BlblNC
SSB0byBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGFjY2Vzc2VzLCBIUy1tb2RlCmhhbmRsZXMgaXQncyBv
d24gbWlzYWxpZ25lZCBhY2Nlc3NlcyB0aHJvdWdoIHRoZSB0cmFwIGhhbmRsZXIuIFdpdGggdGhh
dApjb25maWd1cmF0aW9uLCBpZiBWUy1tb2RlIGdlbmVyYXRlIGEgbWlzYWxpZ25lZCBhY2Nlc3Ms
IGl0IHdpbGwgZW5kIHVwCmJlaW5nIHJlZGlyZWN0ZWQgdG8gVlMtbW9kZSBhbmQgd29uJ3QgYmUg
aGFuZGxlIGJ5IEhTLW1vZGUuCgpUbyBzdW1tYXJpemUsIHByaW9yIHRvIEZXRlQsIG1lZGVsZWcg
d2Fzbid0IGRlbGVnYXRpbmcgbWlzYWxpZ25lZAphY2Nlc3NlcyB0byBTLW1vZGU6CgotIFZTLW1v
ZGUgbWlzYWxpZ25lZCBhY2Nlc3MgLT4gdHJhcCB0byBNLW1vZGUgLT4gT3BlblNCSSBoYW5kbGUg
aXQgLT4KQmFjayB0byBWUy1tb2RlLCBtaXNhbGlnbmVkIGFjY2VzcyBmaXhlZCB1cCBieSBPcGVu
U0JJCgpOb3cgdGhhdCBMaW51eCB1c2VzIFNCSSBGV0ZUIHRvIGRlbGVnYXRlcyBtaXNhbGlnbmVk
IGFjY2Vzc2VzICh3aXRob3V0CmhlZGVsZWcgYmVpbmcgc2V0IGZvciBtaXNhbGlnbmVkIGRlbGVn
YXRpb24sIGJ1dCB0aGF0IGRvZXNuJ3QgcmVhbGx5Cm1hdHRlciwgdGhlIG91dGNvbWUgaXMgdGhl
IHNhbWUpOgoKLSBWUy1tb2RlIG1pc2FsaWduZWQgYWNjZXNzIC0+IHRyYXAgdG8gSFMtbW9kZSAt
PiByZWRpcmVjdGlvbiB0bwpWUy1tb2RlLCBuZWVkcyB0byBoYW5kbGUgdGhlIG1pc2FsaWduZWQg
YWNjZXNzIGJ5IGl0c2VsZgoKClRoaXMgbWVhbnMgdGhhdCBwcmV2aW91c2x5LCBtaXNhbGlnbmVk
IGFjY2VzcyB3ZXJlIHNpbGVudGx5IGZpeGVkIHVwIGJ5Ck9wZW5TQkkgZm9yIFZTLW1vZGUgYW5k
IG5vdyB0aGF0IEZXRlQgaXMgdXNlZCBmb3IgZGVsZWdhdGlvbiwgdGhpcyBpc24ndAp0cnVlIGFu
eW1vcmUuIFNvLCBvbGQga2VybmVsIG9yIHN1ZXBydmlzb3Igc29mdHdhcmUgdGhhdCAgaW5jbHVk
ZWQgY29kZQp0byBoYW5kbGUgbWlzYWxpZ25lZCBhY2Nlc3NlcyB3aWxsIGNyYXNoLiBEaWQgSSBt
aXNzZWQgc29tZXRoaW5nID8KCk5vdGU6IHRoaXMgaXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8g
eW91ciBzZXJpZXMgYnV0IG15IGludHJvZHVjdGlvbiBvZgpGV0ZUICEKClRoYW5rcywKCkNsw6lt
ZW50Cgo+IAo+IEJlc3QgUmVnYXJkcywKPiBYdSBMdQo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+IENs
w6ltZW50Cj4+Cj4+Pgo+Pj4gVGhhbmtzLgo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4KCgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

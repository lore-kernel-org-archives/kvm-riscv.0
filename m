Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E458DFC6160
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqwA8BRHZVn6XNKJCkfbMsIFNDCEr6TTTPD1oUs8WUw=; b=UjMO5qBVAQPMfS
	2GE5NeHhzrIyOcukDQ+hzYo+Yl/0gXGKEyHcS3zrWiA9XuM/EYCyOLroxtsObo0wRGxA7L0AhTDg8
	08pJOJX/d7aKnYJzrPLPETc8HLwZuZxSjcJnHcS8jAd6zAwpZhZZvY3n1IAhECtHKSZ7Oi3lVp4kW
	7IK1uBxHyfby6XNKKCtF4eneU+oqkLinhBLPXLgrllz9PJfCGmscPcgrNhZwCICUv2bER9YxXZe75
	u0CVG8EadqrIwKUreXlhBL6BsVBAIehTP6oX0fzmydOnM2zT8Ty7i56DCXsZgVcfv1oR9/zykCkfx
	dt0CCriFq7H0JYlIW2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Xw-00000009RPs-2kL0;
	Sat, 03 Jan 2026 15:28:04 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Xr-00000009ROc-3hal
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:28:01 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-55999cc2a87so3121754e0c.0
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767454079; x=1768058879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruX6hkZHpdO19qjzRbCVwQHVnwKXr2Vj+4KOiXtfqv4=;
        b=mtV5hS24HRCFQKWW7kV7xoJ3NFLRYBVlUUgKRVQDsvOinKYDXWu4+aBq2pCVqD/8AM
         F/F/fZShSJwTEweKEvVkVG00QwJGurncs8tr8UQomuD7aH3OTLiXcaRygTUHv5yBlm/1
         1NtGV6Ued4G/ySVFFG0YqjDsE7m4u887aLdMsrO370SMSTM3cllTHlfzen56llwj6t98
         SOXPKSw4zOl1ainYIaN9mVmZWSoXuzaC7f563WlHJcHOYFLpRiJQBQ/LRGRuJCpg60GA
         gj4FAv6A2mD4QSD20f3EZiRxNNyU5HEXODi//MZy99U6M7rvUzSGZ5F9Y0XdP2t+YTAM
         lNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767454079; x=1768058879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ruX6hkZHpdO19qjzRbCVwQHVnwKXr2Vj+4KOiXtfqv4=;
        b=P25ARYZjkk5HykGvX48nlExun6oUbnZnl3afBroWcqYOfXaMH4TsCDyXIkgTfN2UJA
         sXvWXXwrdRvDtDUAgB+FiuLQL5qwLhmwfx4EtTAvIRSmr3kte6Sq/3zU5ddXUWsrQsNt
         DmJKiewruH3CAHmAlNqfmzWp7rNiSz2P+0+gHBv+E+5jN/XbLJ9Dl5kWIGcwdCns0D1A
         vaIwElr5AdFg+tYoyrmlj/xo6ySH8Bfel4rkVOCc3AyAlhFVDXMzEddskv3WK5e1mi42
         AJwfvaabVsJbO3REysSg6Iu8VCGnIvH5P6i88qQVlQWNNDzPVmSkZtWEyLNCQ1z5H/jW
         gLWw==
X-Forwarded-Encrypted: i=1; AJvYcCUeDaW2zk0kaYmob2Msi8NouBC3fAqCOBGrr+PvuCe/+JPMOKTGFHEXM19WcIUryfwNIWyF6kf+sjs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPcxyJySN3FQGhQTJlcrw8n7+8JP2pAmNF5ilGsx/5pc0nUEy
	q8F6SIsldJemJ26zvwcOjdLgs7KfAySacRqM0oXAwV+APRaDcYpASihma+K7wAJbZpuPoezp7VI
	Up03Due9S82IPPEm7BpnJf4hiE3yPZow=
X-Gm-Gg: AY/fxX7+ktCzxrpkh4/0HoA/QKLXL61/3Fhz5Fht1uZDsdcKJFo8//EWtsczyNhcn0D
	yMEiSfHiXkwLURdCYYMu0VUIAOvZGissHv75lqb7p7FlbEWKUq1H3LNhG6t3KfexO3BJjgbEmRk
	VHB2fW6w5IUsTK/PsBrhyBW1OiTyHgzawrrh3JXj0qi8b12tmVwb23Y2js0Fk4NdZqk+RByNGuB
	QFvF604o7rCYw/dZ9WIJgL6+DtHMMXLsDxuGDSYYE9uXIEimOYUo9TBPPHpNjJO7AH1m/t+qgly
	Gjv7E/Hrx3MPHKWnhMvPDImegUPx1A==
X-Google-Smtp-Source: AGHT+IH4gY4RfbC6mCW6a26ygEBFnWc5dKuuMqfKZP9/F7nbOwJpx2ZHveFzv9IC2z6uJv1SWOQB2aZTEup8AesAsu8=
X-Received: by 2002:a05:6122:1d06:b0:559:6d5c:9722 with SMTP id
 71dfb90a1353d-5615bbaa53bmr12417664e0c.0.1767454078672; Sat, 03 Jan 2026
 07:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
 <20260103094501.5625-2-naohiko.shimizu@gmail.com> <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
In-Reply-To: <CAK9=C2XTi9Gjy0oJExGyaVvPbh2+cJzmeea5JnMR4d3kbvDJDA@mail.gmail.com>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Sun, 4 Jan 2026 00:27:49 +0900
X-Gm-Features: AQt7F2rlTBHoChBm3AeMEsf79WeYBG_gY4U7DCYfbuqICMO-T2SE5U5F85_BEa0
Message-ID: <CAA7_YY_WuAR7-VUEuu8D5=aZZSqASGwShawxbC-jKp+S2WRd5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
To: Anup Patel <apatel@ventanamicro.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072759_926077_97148B07 
X-CRM114-Status: GOOD (  15.28  )
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

SGkgQW51cCwKCkkgaGF2ZSBqdXN0IHN1Ym1pdHRlZCB0aGUgdjIgc2VyaWVzIHdpdGggdGhlIGRl
dGFpbGVkIGRlc2NyaXB0aW9ucyBhcwp5b3Ugc3VnZ2VzdGVkLgoKdjIgbGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MDEwMzE1MjQwMC41NTItMS1uYW9oaWtvLnNoaW1penVA
Z21haWwuY29tL1QvI3UKClJlZ2FyZHMsIE5hb2hpa28gU2hpbWl6dQoKCk9uIFNhdCwgSmFuIDMs
IDIwMjYgYXQgMTE6NDbigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4g
d3JvdGU6Cj4KPiBPbiBTYXQsIEphbiAzLCAyMDI2IGF0IDM6MTbigK9QTSBOYW9oaWtvIFNoaW1p
enUKPiA8bmFvaGlrby5zaGltaXp1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBQbGVhc2UgYWRkIGEg
ZGV0YWlsZWQgY29tbWl0IGRlc2NyaXB0aW9uIGFib3V0IHdoeSB0aGUKPiBuZXcgd2F5IG9mIHBy
b2dyYW1taW5nIHN0aW1lY21wIGlzIGJldHRlci4gQWxzbywgZXhwbGFpbgo+IHdoYXQgdGhlIGN1
cnJlbnQgUHJpdiBzcGVjIHNheXMgaW4gdGhpcyBjb250ZXh0Lgo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTmFvaGlrbyBTaGltaXp1IDxuYW9oaWtvLnNoaW1penVAZ21haWwuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgMyArKy0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYwo+ID4gaW5kZXggNGQ3Y2YzMzg4MjRhLi5jZmM0ZDgzYzQyYzAg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiA+ICsr
KyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ID4gQEAgLTUwLDggKzUwLDkg
QEAgc3RhdGljIGludCByaXNjdl9jbG9ja19uZXh0X2V2ZW50KHVuc2lnbmVkIGxvbmcgZGVsdGEs
Cj4gPgo+ID4gICAgICAgICBpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJpc2N2X3NzdGNfYXZh
aWxhYmxlKSkgewo+ID4gICNpZiBkZWZpbmVkKENPTkZJR18zMkJJVCkKPiA+IC0gICAgICAgICAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBuZXh0X3R2YWwgJiAweEZGRkZGRkZGKTsKPiA+
ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NUSU1FQ01QLCBVTE9OR19NQVgpOwo+ID4g
ICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVBILCBuZXh0X3R2YWwgPj4gMzIp
Owo+ID4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1RJTUVDTVAsIG5leHRfdHZhbCAm
IDB4RkZGRkZGRkYpOwo+ID4gICNlbHNlCj4gPiAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENT
Ul9TVElNRUNNUCwgbmV4dF90dmFsKTsKPiA+ICAjZW5kaWYKPiA+IC0tCj4gPiAyLjM5LjUKPiA+
Cj4gPgo+Cj4gUmVnYXJkcywKPiBBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=

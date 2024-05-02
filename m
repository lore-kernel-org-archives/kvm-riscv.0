From: Thomas Huth <thuth@redhat.com>
Date: Thu, 2 May 2024 11:34:24 +0200
Subject: [kvm-unit-tests PATCH v3 0/5] add shellcheck support
In-Reply-To: <20240502-d231f770256b3ed812eb4246@orel>
References: <20240501112938.931452-1-npiggin@gmail.com>
 <2be99a78-878c-4819-8c42-1b795019af2f@redhat.com>
 <20240502-d231f770256b3ed812eb4246@orel>
Message-ID: <28975cc5-ef8f-4471-baca-0bb792a62084@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 02/05/2024 10.56, Andrew Jones wrote:
> On Thu, May 02, 2024 at 10:23:22AM GMT, Thomas Huth wrote:
>> On 01/05/2024 13.29, Nicholas Piggin wrote:
>>> This is based on upstream directly now, not ahead of the powerpc
>>> series.
>>
>> Thanks! ... maybe you could also rebase the powerpc series on this now? (I
>> haven't forgotten about it, just did not find enough spare time for more
>> reviewing yet)
>>
>>> Since v2:
>>> - Rebased to upstream with some patches merged.
>>> - Just a few comment typos and small issues (e.g., quoting
>>>     `make shellcheck` in docs) that people picked up from the
>>>     last round.
>>
>> When I now run "make shellcheck", I'm still getting an error:
>>
>> In config.mak line 16:
>> AR=ar
>> ^-- SC2209 (warning): Use var=$(command) to assign output (or quote to
>> assign string).
> 
> I didn't see this one when testing. I have shellcheck version 0.9.0.

I'm also using 0.9.0 (from Fedora). Maybe we've got a different default config?

Anyway, I'm in favor of turning this warning of in the config file, it does 
not seem to be really helpful in my eyes. What do you think?

  Thomas



